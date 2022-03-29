import { Router } from "express";
import getInquiries from "./controllers/get-inquiries";
import getSingleInquiry from "./controllers/get-single-inquiry";
import newInquiry from "./controllers/new-inquiry";
import deleteInquiry from "./controllers/delete-inquiry";
import requireToken from "../middleware/authentication";

const inquiriesRouter = Router();

inquiriesRouter.get("/", requireToken, getInquiries);

inquiriesRouter.get("/:id", requireToken, getSingleInquiry);

inquiriesRouter.post("/new", newInquiry);

inquiriesRouter.delete("/:id", requireToken, deleteInquiry);

export default inquiriesRouter;
