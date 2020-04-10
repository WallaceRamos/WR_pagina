// Make Cards
const sectionCards = document.querySelector("section.cards");

const card = document.querySelector("div.card");

const videos = [
  {
    title: "Depressão na Adolescência e Antidepressivos | Drauzio Varella",
    duration: "5.59 min",
    thumb: "https://i.ytimg.com/vi/e-W52pEez20/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&amp;rs=AOn4CLCkSVovTAs02RuvoZnTmPeGXjMy9Q",
    video_id: "e-W52pEez20"

   
  },
  {
    title: "Fatores de risco para hipertensão | Dicas de Saúde | Drauzio Varella",
    duration: "1:40.00 min",
    thumb: "https://i.ytimg.com/vi/a7XKsTueTWM/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCrzgJSmSHf7V8TZuWTOaJM_3js2A",
    video_id: "a7XKsTueTWM"
  },
  {
    title: "Obesidade | Drauzio Varella ",
    duration: "4.39 min",
    thumb: "https://i.ytimg.com/vi/eUwSZZF5-eI/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBXd-MOpuAxK95eId9bWKjnsQ1lUw",
    video_id: "eUwSZZF5-eI"
  },
  {
    title: "Sistema de saúde no Brasil | Drauzio Varella",
    duration: "6.18 min",
    thumb: "https://i.ytimg.com/vi/brnUrUU81Ow/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLD6zYJwvT3RHDLpZFwQPCO5e7wtHQ",
    video_id: "brnUrUU81Ow"
  },
  {
    title: "Os demagogos do sistema penitenciário | Drauzio Varella ",
    duration: "48 min",
    thumb: "https://i.ytimg.com/vi/wDcu4HUGVz0/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLASOSd3jBt_08hZ9Fnvp5eV3Kc-9A",
    video_id: "wDcu4HUGVz0"
  },
  
];
// APLICA A LISTA NA PAGINA
videos.map(video => {
  const cardClone = card.cloneNode(true);
  cardClone.setAttribute("id", video.video_id);
  cardClone.querySelector("img").src = video.thumb;
  cardClone.querySelector(".title").innerHTML = video.title;
  cardClone.querySelector(".info > p.text--medium").innerHTML =
    video.duration;
  sectionCards.appendChild(cardClone);
});

card.remove();

// ONDE É APLICADO AS AÇÕES DO MODAL
const modalOverlay = document.querySelector(".modal-overlay");
const modal = document.querySelector(".modal");
const cards = [...document.querySelectorAll(".cards .card")];
// ABRIR MODAL
cards.forEach(card => {
  card.addEventListener("click", () => {
    modal.querySelector(
      "iframe"
    ).src = `https://www.youtube.com/embed/${card.getAttribute("id")}`;
    modalOverlay.classList.add("active");
    modal.classList.add("active");
    document.querySelector("body").style.overflow = "hidden";
  });
});
// FECHAR MODAL
document.querySelector(".close-modal").addEventListener("click", () => {
  modalOverlay.classList.remove("active");
  modal.classList.remove("active");
  modal.querySelector("iframe").src = ``;
  document.querySelector("body").style.overflow = "initial";
});




