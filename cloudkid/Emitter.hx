package cloudkid;
import pixi.core.display.Container;
import pixi.core.textures.Texture;

extern class Emitter
{
	/**
	 * A particle emitter.
	 * @class Emitter
	 * @constructor
	 * @param {PIXI.DisplayObjectContainer} particleParent The display object to add the
	 *                                                     particles to.
	 * @param {Array|PIXI.Texture|String} [particleImages] A texture or array of textures to use
	 *                                                     for the particles. Strings will be turned
	 *                                                     into textures via Texture.fromImage().
	 * @param {Object} [config] A configuration object containing settings for the emitter.
	 */
	public function new(particleParent:Container, ?particleImages:Array<Dynamic>, ?config:Dynamic);
	
	/**
	 * Kills all active particles immediately.
	 * @method cleanup
	 */
	public function cleanup():Void;
	
	/**
	 * Destroys the emitter and all of its particles.
	 * @method destroy
	 */
	public function destory():Void;
	
	/**
	 * Sets up the emitter based on the config settings.
	 * @method init
	 * @param {Array|PIXI.Texture} art A texture or array of textures to use for the particles.
	 * @param {Object} config A configuration object containing settings for the emitter.
	 */
	public function init(art:Texture, config:Dynamic):Void;
	
	/**
	 * Recycles an individual particle.
	 * @method recycle
	 * @param {Particle} particle The particle to recycle.
	 */
	public function recycle(particle:Particle):Void;
	
	/**
	 * Prevents emitter position interpolation in the next update.
	 * This should be used if you made a major position change of your emitter's owner
	 * that was not normal movement.
	 * @method resetPositionTracking
	 */
	public function resetPositionTracking():Void;
	
	/**
	 * Sets the rotation of the emitter to a new value.
	 * @method rotate
	 * @param {Number} newRot The new rotation, in degrees.
	 */
	public function rotate(newRot:Float):Void;
	
	/**
	 * Updates all particles spawned by this emitter and emits new ones.
	 * @method update
	 * @param {Number} delta Time elapsed since the previous frame, in __seconds__.
	 */
	public function update(delta:Float):Void;
	
	/**
	 * Changes the position of the emitter's owner. You should call this if you are adding
	 * particles to the world display object that your emitter's owner is moving around in.
	 * @method updateOwnerPos
	 * @param {Number} x The new x value of the emitter's owner.
	 * @param {Number} y The new y value of the emitter's owner.
	 */
	public function updateOwnerPos(x:Float, y:Float):Void;
	
	/**
	 * Changes the spawn position of the emitter.
	 * @method updateSpawnPos
	 * @param {Number} x The new x value of the spawn position for the emitter.
	 * @param {Number} y The new y value of the spawn position for the emitter.
	 */
	public function updateSpawnPos(x:Float, y:Float):Void;
}