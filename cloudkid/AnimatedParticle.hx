package cloudkid;
import pixi.core.textures.Texture;

@:native("PIXI.particles.AnimatedParticle")
extern class AnimatedParticle
{
	/**
	 * An individual particle image with an animation. Art data passed to the emitter must be
	 * formatted in a particular way for AnimatedParticle to be able to handle it:
	 *
	 *     {
	 *         //framerate is required. It is the animation speed of the particle in frames per
	 *         //second.
	 *         //A value of "matchLife" causes the animation to match the lifetime of an individual
	 *         //particle, instead of at a constant framerate. This causes the animation to play
	 *         //through one time, completing when the particle expires.
	 *         framerate: 6,
	 *         //loop is optional, and defaults to false.
	 *         loop: true,
	 *         //textures is required, and can be an array of any (non-zero) length.
	 *         textures: [
	 *             //each entry represents a single texture that should be used for one or more
	 *             //frames. Any strings will be converted to Textures with Texture.fromImage().
	 *             //Instances of PIXI.Texture will be used directly.
	 *             "animFrame1.png",
	 *             //entries can be an object with a 'count' property, telling AnimatedParticle to
	 *             //use that texture for 'count' frames sequentially.
	 *             {
	 *                 texture: "animFrame2.png",
	 *                 count: 3
	 *             },
	 *             "animFrame3.png"
	 *         ]
	 *     }
	 *
	 * @class AnimatedParticle
	 * @constructor
	 * @param {Emitter} emitter The emitter that controls this AnimatedParticle.
	 */
	public function new(emitter:Emitter);
	
	/**
	 * Sets the textures for the particle.
	 * @method applyArt
	 * @param {Array} art An array of PIXI.Texture objects for this animated particle.
	 */
	public function applyArt(art:Array<Texture>):Void;
	
	/**
	 * Destroys the particle, removing references and preventing future use.
	 * @method destroy
	 */
	public function destroy():Void;
	
	/**
	 * Initializes the particle for use, based on the properties that have to
	 * have been set already on the particle.
	 * @method init
	 */
	public function init():Void;
	
	/**
	 * Checks over the art that was passed to the Emitter's init() function, to do any special
	 * modifications to prepare it ahead of time.
	 * @method parseArt
	 * @static
	 * @param  {Array} art The array of art data, properly formatted for AnimatedParticle.
	 * @return {Array} The art, after any needed modifications.
	 */
	static public function parseArt(art:Array<Dynamic>):Array<Texture>;
	
	/**
	 * Updates the particle.
	 * @method update
	 * @param {Number} delta Time elapsed since the previous frame, in __seconds__.
	 */
	public function update(delta:Float):Void;
}