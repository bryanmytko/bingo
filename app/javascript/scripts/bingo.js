document.addEventListener("DOMContentLoaded", () => {
  const items = document.querySelectorAll(".bingo-card__item");

  for(let i = 0; i < items.length; i++) {
    items[i].addEventListener('click', function() {
      this.classList.toggle('active');
    });
  }

  const shareLinks = document.querySelectorAll(".share-url");
  console.log(shareLinks)

  for(let i = 0; i < shareLinks.length; i++) {
    shareLinks[i].addEventListener('click', function(e) {
      navigator.clipboard.writeText(this.href).then(() => {
        alert('Copied to clipboard!');
      });;
      e.preventDefault();
    });
  }
});


