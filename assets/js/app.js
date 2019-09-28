// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import { Socket } from "phoenix";
import LiveSocket from "phoenix_live_view";

let Hooks = {};
Hooks.Canvas = {
  mounted() {
    let canvas = this.el;
    let context = canvas.getContext("2d");
    let ratio = getPixelRatio(context);

    resize(canvas, ratio);

    Object.assign(this, { canvas, context });
  },
  updated() {
    let { canvas, context } = this;
    let halfHeight = canvas.height / 2;
    let halfWidth = canvas.width / 2;
    let smallerHalf = Math.min(halfHeight, halfWidth);
    let i = JSON.parse(canvas.dataset.i);

    context.clearRect(0, 0, canvas.width, canvas.height);
    context.fillStyle = "rgba(128, 0, 255, 1)";
    context.beginPath();
    context.arc(
      halfWidth + (Math.cos(i) * smallerHalf) / 2,
      halfHeight + (Math.sin(i) * smallerHalf) / 2,
      smallerHalf / 16,
      0,
      2 * Math.PI
    );
    context.fill();
  }
};

const getPixelRatio = context => {
  var backingStore =
    context.backingStorePixelRatio ||
    context.webkitBackingStorePixelRatio ||
    context.mozBackingStorePixelRatio ||
    context.msBackingStorePixelRatio ||
    context.oBackingStorePixelRatio ||
    context.backingStorePixelRatio ||
    1;

  return (window.devicePixelRatio || 1) / backingStore;
};

const resize = (canvas, ratio) => {
  canvas.width = window.innerWidth * ratio;
  canvas.height = window.innerHeight * ratio;
  canvas.style.width = `${window.innerWidth}px`;
  canvas.style.height = `${window.innerHeight}px`;
};

let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks });
liveSocket.connect();
