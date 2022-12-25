document.addEventListener("DOMContentLoaded", () => {
  /* Bingo card marks */
  const items = document.querySelectorAll(".bingo-card-square");
  const LENGTH = 5;
  const WIDTH = 5;
  const grid = [];

  for (let i = 0; i < items.length; i++) {
    items[i].addEventListener("click", function () {
      this.classList.toggle("active");
      checkWinner();
    });
  }

  for (let i = 0; i < items.length; i += WIDTH) {
    grid.push(items.slice(i, i + WIDTH));
  }

  const checkWinner = () => {
    console.log(grid);
  };

  /* Copy to clipboard */
  const shareLinks = document.querySelectorAll(".share-url");

  for (let i = 0; i < shareLinks.length; i++) {
    shareLinks[i].addEventListener("click", function (e) {
      navigator.clipboard.writeText(this.href).then(() => {
        alert("Copied to clipboard!");
      });
      e.preventDefault();
    });
  }

  /* Entries validation */
  const entries = document.getElementById("card_entries");

  if (entries) {
    const MIN = 24;
    const entries = document.getElementById("card_entries");
    const entries_label =
      document.getElementsByClassName("entries-validation")[0];
    entries_label.innerHTML = `${entriesCount()} / ${MIN} Entries`;

    function entriesCount() {
      const btn = document.getElementsByClassName("card-create-submit")[0];
      const value = entries.value;
      const split = value
        .split("\n")
        .join(",")
        .split(",")
        .filter((e) => e.trim());
      const length = split.length;

      btn.disabled = length >= MIN ? false : true;

      return split.length;
    }

    function updateCountLabel() {
      entries_label.innerHTML = `${entriesCount()} / ${MIN} Entries`;
    }

    entries.addEventListener("keyup", updateCountLabel);
  }
});
