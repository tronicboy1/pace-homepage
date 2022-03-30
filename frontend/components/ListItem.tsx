import React from "react";
import styles from "./ListItem.module.css";

const ListItem: React.FC<{ id?: string }> = props => {
  return (
    <li id={props.id} className={styles["generic-li"]}>
      {props.children}
    </li>
  );
};

export default ListItem;