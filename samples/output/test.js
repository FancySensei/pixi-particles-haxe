(function () { "use strict";
var Main = function() { };
Main.main = function() {
	new Test();
};
var Test = function() {
	this.lastTimeStamp = 0;
	var options = { backgroundColor : 3948629, transparent : false, autoResize : false, resolution : 1.0, clearBeforeRender : true, antialias : false, forceFXAA : false, preserveDrawingBuffer : false};
	this.renderer = PIXI.autoDetectRenderer(800,600,options);
	window.document.body.appendChild(this.renderer.view);
	this.addStats();
	this.init();
	window.requestAnimationFrame($bind(this,this.onRequestAnimationFrame));
};
Test.prototype = {
	init: function() {
		this.stage = new PIXI.Container();
		this.emitter = new cloudkid.Emitter(this.stage,[PIXI.Texture.fromImage("particle.png",false)],{ alpha : { start : 1, end : 0}, scale : { start : 0.2, end : 2, minimumScaleMultiplier : 0.5}, color : { start : "#4cffff", end : "#e121e8"}, speed : { start : 100, end : 0}, acceleration : { x : 0, y : 1000}, startRotation : { min : -180, max : 180}, rotationSpeed : { min : 50, max : 200}, lifetime : { min : 0.8, max : 2}, blendMode : "add", frequency : 0.002, emitterLifetime : -1, maxParticles : 800, pos : { x : 400., y : 100}, addAtBack : true, spawnType : "rect", spawnRect : { x : -150, y : 0, w : 300, h : 20}});
	}
	,update: function(dt) {
		dt /= 1000.0;
		this.emitter.update(dt);
	}
	,onRequestAnimationFrame: function(now) {
		this.update(now - this.lastTimeStamp);
		this.renderer.render(this.stage);
		this.lastTimeStamp = now;
		window.requestAnimationFrame($bind(this,this.onRequestAnimationFrame));
		this.stats.update();
		return true;
	}
	,addStats: function() {
		if(window.Stats != null) {
			var container;
			var _this = window.document;
			container = _this.createElement("div");
			window.document.body.appendChild(container);
			this.stats = new Stats();
			this.stats.domElement.style.position = "absolute";
			this.stats.domElement.style.top = "14px";
			this.stats.domElement.style.right = "0px";
			container.appendChild(this.stats.domElement);
			this.stats.begin();
			var ren;
			var _this1 = window.document;
			ren = _this1.createElement("div");
			ren.style.position = "absolute";
			ren.style.width = "76px";
			ren.style.top = "0px";
			ren.style.right = "0px";
			ren.style.background = "#CCCCCC";
			ren.style.backgroundColor = "#105CB6";
			ren.style.fontFamily = "Helvetica,Arial";
			ren.style.padding = "2px";
			ren.style.color = "#0FF";
			ren.style.fontSize = "9px";
			ren.style.fontWeight = "bold";
			ren.style.textAlign = "center";
			window.document.body.appendChild(ren);
			ren.innerHTML = ["UNKNOWN","WEBGL","CANVAS"][this.renderer.type] + " - " + this.renderer.resolution;
		} else console.log("Unable to find stats.js");
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
Test.WIDTH = 800;
Test.HEIGHT = 600;
Main.main();
})();
