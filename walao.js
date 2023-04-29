let data = [
  "B$u$i$ld",
  "$t$$h$e",
  "N$e$x$t",
  "E$$ra",
  "$$o$f$",
  "S$$of$t$wa$r$e",
  "De$$ve$l$op$me$n$t",
];

let result = "";

for (let i = 0; i < data.length; i++) {
  for (let j = 0; j < data[i].length; j++) {
    if (data[i][j] !== "$") {
      result += data[i][j].toUpperCase();
    }
  }
  if (i < data[i].length - 1) {
    result += " ";
  }
}

console.log(data.join(" ").replace(/\$/g, "").toUpperCase());
