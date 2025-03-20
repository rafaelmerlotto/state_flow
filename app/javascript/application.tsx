import React from "react";
import { createRoot } from "react-dom/client";
import App from "./components/App";

document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("root");
    if (container) {
        createRoot(container).render(<App />);
    }
});