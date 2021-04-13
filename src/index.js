import printHtmlToPDF from "print-html-to-pdf";

const printButton = document.getElementById("print-button");
printButton.addEventListener("click", async (event) => {
  const node = document.getElementById("content");
  const pdfOption = {
    jsPDF: {
      unit: "px",
      format: "letter",
    },
    spin: false,
    fileName: "default",
    // If it is true the entire content will fit into one page with margin assigned
    // If false and content is bigger than one page than it will be printed to other pages
    fitToPage: false, // default is false
  };
  await printHtmlToPDF.print(node, pdfOption);
});
