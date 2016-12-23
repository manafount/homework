import React from 'react';
import ReactDOM from 'react-dom';
import Calculator from './calculator.jsx';

document.addEventListener("DOMContentLoaded", () => {
	const main = document.getElementById("main");
	ReactDOM.render(<Calculator/>, main);
});
