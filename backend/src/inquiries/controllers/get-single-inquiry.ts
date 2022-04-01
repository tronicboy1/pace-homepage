import { Request, Response } from "express";
import sql from "../../db";
import { InquiryDBRecord } from "../../types";

const getSingleInquiry = async (req: Request, res: Response) => {
  const inquiryId = Number(req.params.id);

  try {
    if (isNaN(inquiryId)) throw Error("Inquiry ID must be a number.");

    const [inquiry] = await sql<
      InquiryDBRecord[]
    >`SELECT inquiry_id AS id, body, email, phone, first_name, last_name, viewed, created_at
    FROM inquiries
    WHERE inquiry_id = ${inquiryId}`;

    res.json({
      id: inquiry.id,
      body: inquiry.body,
      phone: inquiry.phone,
      email: inquiry.email,
      firstName: inquiry.first_name,
      lastName: inquiry.last_name,
      viewed: inquiry.viewed,
      createdAt: inquiry.created_at,
    });
  } catch (error) {
    res.status(400).json({
      message: error instanceof Error ? error.message : "Invalid request.",
    });
  }
};

export default getSingleInquiry;
