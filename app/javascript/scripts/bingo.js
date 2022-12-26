document.addEventListener("DOMContentLoaded", () => {
  /* Bingo card marks */
  const items = document.querySelectorAll(".bingo-card-square");
  const winner = document.querySelector("#winner");
  const squares = Array.from(items);
  const WIDTH = 5;
  const grid = [];

  for (let i = 0; i < squares.length; i += WIDTH) {
    grid.push(squares.slice(i, i + WIDTH).map((_) => 0));
  }

  for (let i = 0; i < items.length; i++) {
    items[i].id = i;
    items[i].addEventListener("click", function () {
      this.classList.toggle("active");
      const y = Math.floor(i / 5);
      const x = i % 5;

      grid[y][x] = grid[y][x] === 0 ? 1 : 0;

      checkWinner();
    });
  }

  const checkWinner = () => {
    let principal = 0;
    let secondary = 0;

    const transposedGrid = grid[0].map((_, i) => grid.map((row) => row[i]));

    const rowWin = grid.some((row) => row.every((item) => item === 1));
    const colWin = transposedGrid.some((row) =>
      row.every((item) => item === 1)
    );

    for (let i = 0; i < WIDTH; i++) {
      for (let j = 0; j < WIDTH; j++) {
        if (i == j) principal += grid[i][j];
        if (i + j == WIDTH - 1) secondary += grid[i][j];
      }
    }

    const diagWin = principal >= WIDTH || secondary >= WIDTH;

    if (rowWin || colWin || diagWin) return winner.classList.remove("hidden");
    winner.classList.add("hidden");
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
