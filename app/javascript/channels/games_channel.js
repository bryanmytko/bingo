import consumer from "./consumer";

console.log("a;klsj;lkajsdf");

consumer.subscriptions.create(
  { channel: "GamesChannel" },
  {
    received(data) {
      this.appendLine(data);
    },

    appendLine(data) {
      const html = this.createLine(data);
      const element = document.querySelector("[data-game-dashboard='users']");
      element.insertAdjacentHTML("beforeend", html);
    },

    createLine(data) {
      return `
      <article class="chat-line">
        <span class="speaker">${data}</span>
        <span class="body">${data["body"]}</span>
      </article>
    `;
    },
  }
);
