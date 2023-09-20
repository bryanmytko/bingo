import consumer from "./consumer";

consumer.subscriptions.create(
  { channel: "GamesChannel" },
  {
    received(data) {
      this.appendUser(data);
    },

    connected() {},

    appendUser(data) {
      const html = this.createLine(data);
      const element = document.querySelector("[data-game-dashboard='users']");
      element.insertAdjacentHTML("beforeend", html);
    },

    createLine(data) {
      return `<span class="speaker">${data.user.email}</span>`;
    },
  }
);
