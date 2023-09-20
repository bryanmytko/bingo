const shareLinks = document.querySelectorAll(".share-url");

for (let i = 0; i < shareLinks.length; i++) {
  shareLinks[i].addEventListener("click", function (e) {
    const bubble = shareLinks[i].previousElementSibling;

    navigator.clipboard.writeText(this.href).then(() => {
      bubble.classList.toggle("fade");
      setTimeout(function () {
        bubble.classList.toggle("fade");
      }, 800);
    });
    e.preventDefault();
  });
}
