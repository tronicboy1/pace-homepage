import type { NextPage } from "next";
import { useRouter } from "next/router";
import { useContext, useEffect, useState } from "react";
import Card from "../../components/UI/Card";
import Observer from "../../components/UI/Observer";
import { AuthContext } from "../../context/auth-context";
import styles from "../../styles/Admin.module.css";

const fetchInquiries = (page: number, limit: number) =>
  fetch(
    `${process.env.NEXT_PUBLIC_API_URI}/inquiries?limit=${limit}&page=${page}`,
    {
      credentials: "include",
    }
  ).then(result => {
    if (!result.ok)
      throw Error(
        `Inquiry Fetch Failed: ${result.status} ${result.statusText}`
      );
    return result.json();
  });

const Admin: NextPage = () => {
  const router = useRouter();
  const context = useContext(AuthContext);

  const [inquiries, setInquiries] = useState<Inquiry[]>([]);
  const [inquiryError, setInquiryError] = useState<string | null>(null);
  const [fetchComplete, setFetchComplete] = useState(false);
  const [inquiryPage, setInquiryPage] = useState(0);
  const [inquiryEndInView, setInquiryEndInView] = useState(false);

  useEffect(() => {
    if (inquiryEndInView && inquiries.length && !fetchComplete) {
      setInquiryPage(prev => prev + 1);
    }
  }, [inquiryEndInView]);

  useEffect(() => {
    {fetchInquiries(inquiryPage, 5)
      .then(data => {
        if (!data.length) {
          setFetchComplete(true);
        }
        setInquiries(prev => [...prev, ...data]);
      })
      .catch(error => setInquiryError(error));}
  }, [inquiryPage]);

  const handleInquiryClick = (id: number) =>
    router.push(`/admin/inquiry/${id}`);

  return (
    <>
      <h1 className={styles.title}>管理画面</h1>
      <div className={styles.row}>
        <Card className="flex">
          <h4>お問合せ一覧</h4>
          <ul className={styles["inquiries-list"]}>
            {inquiries.map(inquiry => (
              <li
                onClick={handleInquiryClick.bind(null, inquiry.id)}
                key={inquiry.id}
              >
                <section style={{ flex: "10%" }}>{inquiry.id}</section>
                <section className={styles.column} style={{ flex: "90%" }}>
                  <small>
                    {new Date(inquiry.createdAt).toLocaleString("ja")}
                  </small>
                  <section>{inquiry.body}</section>
                </section>
              </li>
            ))}
            <Observer setInView={setInquiryEndInView} />
          </ul>
        </Card>
        <Card className="flex">
          <h4>新規投稿</h4>
        </Card>
      </div>
    </>
  );
};

export default Admin;
