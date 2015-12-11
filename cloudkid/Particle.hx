package cloudkid;
import pixi.core.math.Point;
import pixi.core.textures.Texture;

extern class Particle
{
	/**
	 * An individual particle image. You shouldn't have to deal with these.
	 * @class Particle
	 * @constructor
	 * @param {Emitter} emitter The emitter that controls this particle.
	 */
	public function new(emitter:Emitter);
	
	/**
	 * Acceleration to apply to the particle.
	 * @property {PIXI.Point} accleration
	 */
	public var accleration:Point;
	
	/**
	 * The current age of the particle, in seconds.
	 * @property {Number} age
	 */
	public var age:Float;
	
	/**
	 * A simple easing function to be applied to all properties that
	 * are being interpolated.
	 * @property {Function} ease
	 */
	public var ease:Dynamic;
	
	/**
	 * The emitter that controls this particle.
	 * @property {Emitter} emitter
	 */
	public var emitter:Emitter;
	
	/**
	 * The alpha of the particle at the end of its life.
	 * @property {Number} endAlpha
	 */
	public var endAlpha:Float;
	
	/**
	 * The tint of the particle at the start of its life.
	 * @property {Array} endColor
	 */
	public var endColor:Array<Int>;
	
	/**
	 * The scale of the particle at the start of its life.
	 * @property {Number} endScale
	 */
	public var endScale:Float;
	
	/**
	 * The speed of the particle at the end of its life.
	 * @property {Number} endSpeed
	 */
	public var endSpeed:Float;
	
	/**
	 * Extra data that the emitter passes along for custom particles.
	 * @property {Object} extraData
	 */
	public var extraData:Dynamic;
	
	/**
	 * The maximum lifetime of this particle, in seconds.
	 * @property {Number} maxLife
	 */
	public var maxLife:Float;
	
	/**
	 * The alpha of the particle at the start of its life.
	 * @property {Number} startAlpha
	 */
	public var startAlpha:Float;
	
	/**
	 * The tint of the particle at the start of its life.
	 * @property {Array} startColor
	 */
	public var startColor:Array<Int>;
	
	/**
	 * The scale of the particle at the start of its life.
	 * @property {Number} startScale
	 */
	public var startScale:Float;
	
	/**
	 * The speed of the particle at the start of its life.
	 * @property {Number} startSpeed
	 */
	public var startSpeed:Float;
	
	/**
	 * The velocity of the particle. Speed may change, but the angle also
	 * contained in velocity is constant.
	 * @property {PIXI.Point} velocity
	 */
	public var velocity:Point;
	
	/**
	 * Sets the texture for the particle. This can be overridden to allow
	 * for an animated particle.
	 * @method applyArt
	 * @param {PIXI.Texture} art The texture to set.
	 */
	public function applyArt(art:Texture):Void;
	
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
	 * Kills the particle, removing it from the display list
	 * and telling the emitter to recycle it.
	 * @method kill
	 */
	public function kill():Void;
	
	/**
	 * Checks over the art that was passed to the Emitter's init() function, to do any special
	 * modifications to prepare it ahead of time.
	 * @method parseArt
	 * @static
	 * @param  {Array} art The array of art data. For Particle, it should be an array of Textures.
	 *                     Any strings in the array will be converted to Textures via
	 *                     Texture.fromImage().
	 * @return {Array} The art, after any needed modifications.
	 */
	static public function parseArt(art:Array<Dynamic>):Array<Texture>;
	
	/**
	 * Parses extra emitter data to ensure it is set up for this particle class.
	 * Particle does nothing to the extra data.
	 * @method parseData
	 * @static
	 * @param  {Object} extraData The extra data from the particle config.
	 * @return {Object} The parsed extra data.
	 */
	static public function parseData(extraData:Dynamic):Dynamic;
	
	/**
	 * Updates the particle.
	 * @method update
	 * @param {Number} delta Time elapsed since the previous frame, in __seconds__.
	 * @return {Number} The standard interpolation multiplier (0-1) used for all relevant particle
	 *                   properties. A value of -1 means the particle died of old age instead.
	 */
	public function update(delta:Float):Float;
}