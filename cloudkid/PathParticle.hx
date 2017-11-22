package cloudkid;
import pixi.core.textures.Texture;

@:native("PIXI.particles.PathParticle")
extern class PathParticle
{
	/**
	 * An particle that follows a path defined by an algebraic expression, e.g. "sin(x)" or
	 * "5x + 3".
	 * To use this class, the particle config must have a "path" string in the
	 * "extraData" parameter. This string should have "x" in it to represent movement (from the
	 * speed settings of the particle). It may have numbers, parentheses, the four basic
	 * operations, and the following Math functions or properties (without the preceding "Math."):
	 * "pow", "sqrt", "abs", "floor", "round", "ceil", "E", "PI", "sin", "cos", "tan", "asin",
	 * "acos", "atan", "atan2", "log".
	 * The overall movement of the particle and the expression value become x and y positions for
	 * the particle, respectively. The final position is rotated by the spawn rotation/angle of
	 * the particle.
	*
	 * Some example paths:
	*
	 * 	"sin(x/10) * 20" // A sine wave path.
	 * 	"cos(x/100) * 30" // Particles curve counterclockwise (for medium speed/low lifetime particles)
	 * 	"pow(x/10, 2) / 2" // Particles curve clockwise (remember, +y is down).
	*
	 * @class PathParticle
	 * @constructor
	 * @param {Emitter} emitter The emitter that controls this PathParticle.
	 */
	public function new(emitter:Emitter);
	
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
	 * modifications to prepare it ahead of time. This just runs Particle.parseArt().
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
	 * PathParticle checks for the existence of path data, and parses the path data for use
	 * by particle instances.
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
	 */
	public function update(delta:Float):Void;
}