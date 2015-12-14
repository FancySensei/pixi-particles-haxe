package;
import cloudkid.Emitter;
import cloudkid.Particle;
import js.Browser;
import jsfps.stats.Stats;
import pixi.core.display.Container;
import pixi.core.renderers.Detector;
import pixi.core.renderers.Detector.RenderingOptions;
import pixi.core.renderers.SystemRenderer;
import pixi.core.textures.Texture;

class Test
{
	static private inline var WIDTH:Int = 800;
	static private inline var HEIGHT:Int = 600;
	
	private var renderer:SystemRenderer;
	private var stage:Container;
	private var emitter:Emitter;
	
	private var lastTimeStamp:Float = 0;
	private var stats:Stats;
	
	public function new()
	{
		// Init PixiJS
		var options:RenderingOptions =
		{
			backgroundColor: 0x3C4055,
			transparent: false,
			autoResize: false,
			resolution: 1.0,
			clearBeforeRender: true,
			antialias: false,
			forceFXAA: false,
			preserveDrawingBuffer: false
		}
		renderer = Detector.autoDetectRenderer(WIDTH, HEIGHT, options);
		Browser.document.body.appendChild(renderer.view);
		
		// Add FPS stats
		addStats();
		
		// Init Particles
		init();
		
		// Update!
		Browser.window.requestAnimationFrame(onRequestAnimationFrame);
	}
	
	private function init():Void
	{
		stage = new Container();
		
		emitter = new Emitter(stage, [Texture.fromImage("particle.png", false)],
			{
				"alpha": {
					"start": 1,
					"end": 0
				},
				"scale": {
					"start": 0.2,
					"end": 2,
					"minimumScaleMultiplier": 0.5
				},
				"color": {
					"start": "#4cffff",
					"end": "#e121e8"
				},
				"speed": {
					"start": 100,
					"end": 0
				},
				"acceleration": {
					"x": 0,
					"y": 1000
				},
				"startRotation": {
					"min": -180,
					"max": 180
				},
				"rotationSpeed": {
					"min": 50,
					"max": 200
				},
				"lifetime": {
					"min": 0.8,
					"max": 2
				},
				"blendMode": "add",
				"frequency": 0.002,
				"emitterLifetime": -1,
				"maxParticles": 800,
				"pos": {
					"x": WIDTH / 2,
					"y": 100
				},
				"addAtBack": true,
				"spawnType": "rect",
				"spawnRect": {
					"x": -150,
					"y": 0,
					"w": 300,
					"h": 20
				}
			}
		);
	}
	
	private function update(dt:Float):Void
	{
		// from milliseconds (engine ticks) to seconds
		dt /= 1000.0;
		
		// Update the emitter
		emitter.update(dt);
	}
	
	@:noCompletion function onRequestAnimationFrame(now:Float):Bool
	{
		update(now - lastTimeStamp);
		renderer.render(stage);
		
		lastTimeStamp = now;
		Browser.window.requestAnimationFrame(onRequestAnimationFrame);
		stats.update();
		
		return true;
	}
	
	@:noCompletion function addStats():Void
	{
		if (untyped __js__("window").Stats != null)
		{
			var container = Browser.document.createDivElement();
			Browser.document.body.appendChild(container);
			stats = new Stats();
			stats.domElement.style.position = "absolute";
			stats.domElement.style.top = "14px";
			stats.domElement.style.right = "0px";
			container.appendChild(stats.domElement);
			stats.begin();
			
			var ren = Browser.document.createDivElement();
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
			Browser.document.body.appendChild(ren);
			ren.innerHTML = ["UNKNOWN", "WEBGL", "CANVAS"][renderer.type] + " - " + renderer.resolution;
		}
		else
		{
			trace("Unable to find stats.js");
		}
	}
}