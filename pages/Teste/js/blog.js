// Make Cards
const sectionLoop = document.querySelector("div.Loops");

const loop = document.querySelector("div.Loop");

const blogs = [
  {
    Link: "./pages/Blog/depressao.html",
    title: "Depressão, saiba caracterizar essa doença.  ",
    data: "26/02/2020",
    thumb: "background-image: url(./assets/depresão.jpeg)",
    id: "1"
  },
  {
    Link: "./pages/Blog/tristeza.html",
    title: "As pessoas morrem de tristeza.",
    data: "09/04/2020",
    thumb: "background-image: url(./assets/tristeza.jpeg)",
    id: "2"
  }, 
  {
    Link: "./pages/Blog/mente.html",
    title: "Melhorar sua saude mental ",
    data: "09/04/2020",
    thumb: "background-image: url(./assets/mente.jpeg)",
    id: "3"
  },
  {
    Link: "./pages/Blog/coronavirus.html",
    title: "Mente protegida do COVID-19 ",
    data: "09/04/2020",
    thumb: "background-image: url(./assets/proteger.jpeg)",
    id: "4"
  },
  
  {
    Link: "./pages/Blog/panico.html",
    title: "Como evitar o pânico",
    data: "21/08/2011",
    thumb: "background-image: url(./assets/panico.jpeg)",
    id: "5"
  },
  ,
];
// APLICA A LISTA NA PAGINA
blogs.map(blog => {
  const loopClone = loop.cloneNode(true);
  loopClone.setAttribute("id", blog.id);
  loopClone.querySelector(".item-image").style = blog.thumb;
  loopClone.querySelector("a").href = blog.Link;
  loopClone.querySelector(".title").innerHTML = blog.title;
  loopClone.querySelector(".secondary-tag").innerHTML = blog.data;
  sectionLoop.appendChild(loopClone);
});

loop.remove();