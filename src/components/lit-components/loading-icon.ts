import { LitElement, html, css } from "lit";
import { customElement } from "lit/decorators.js";
import { globalStyles } from "./styles";

export const tagName = "loading-icon";

@customElement(tagName)
export class LoadingIcon extends LitElement {
  static styles = [
    globalStyles,
    css`
      :host([small]) {
        height: 20px;
        min-width: 20px;
        display: block;
        position: relative;
      }

      :host([small]) svg {
        fill: white;
        max-height: 200%;
      }

      :host([black]) svg {
        fill: black;
      }

      svg {
        fill: #de9e48;
        width: 100%;
        max-width: 100px;
        margin: auto;
        position: absolute;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        animation: spin 2s linear infinite;
      }

      @keyframes spin {
        100% {
          transform: rotate(360deg);
        }
      }
    `,
  ];

  render() {
    return html`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
      <path d="M0 0h24v24H0V0z" fill="none" />
      <path
        d="M12 6v3l4-4-4-4v3c-4.42 0-8 3.58-8 8 0 1.57.46 3.03 1.24 4.26L6.7 14.8c-.45-.83-.7-1.79-.7-2.8 0-3.31 2.69-6 6-6zm6.76 1.74L17.3 9.2c.44.84.7 1.79.7 2.8 0 3.31-2.69 6-6 6v-3l-4 4 4 4v-3c4.42 0 8-3.58 8-8 0-1.57-.46-3.03-1.24-4.26z"
      />
    </svg>`;
  }
}
