package cloudkid;
import pixi.core.display.Container;
import pixi.core.math.Point;
import pixi.core.math.shapes.Circle;
import pixi.core.math.shapes.Rectangle;
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
	 * If either ownerPos or spawnPos has changed since the previous update.
	 * @property {Boolean} _posChanged
	 */
	public var _posChanged:Bool;
	
	/**
	 * Acceleration to apply to particles. Using this disables
	 * any interpolation of particle speed. If the particles do
	 * not have a rotation speed, then they will be rotated to
	 * match the direction of travel.
	 * @property {PIXI.Point} acceleration
	 * @default null
	 */
	public var acceleration:Point;
	
	/**
	 * If particles should be added at the back of the display list instead of the front.
	 * @property {Boolean} addAtBack
	 */
	public var addAtBack:Bool;
	
	/**
	 * Angle at which to start spawning particles in a burst.
	 * @property {Number} angleStart
	 * @default 0
	 */
	public var angleStart:Float;
	
	/**
	 * An easing function for nonlinear interpolation of values. Accepts a single
	 * parameter of time as a value from 0-1, inclusive. Expected outputs are values
	 * from 0-1, inclusive.
	 * @property {Function} customEase
	 */
	public var customEase:Float->Float;
	
	/**
	 * If particles should be emitted during update() calls. Setting this to false
	 * stops new particles from being created, but allows existing ones to die out.
	 * @property {Boolean} emit
	 */
	public var emit:Bool;
	
	/**
	 * The amount of time in seconds to emit for before setting emit to false.
	 * A value of -1 is an unlimited amount of time.
	 * @property {Number} emitterLifetime
	 * @default -1
	 */
	public var emitterLifetime:Float;
	
	/**
	 * The ending alpha of all particles.
	 * @property {Number} endAlpha
	 * @default 1
	 */
	public var endAlpha:Float;
	
	/**
	 * The ending color of all particles, as red, green, and blue uints from 0-255.
	 * @property {Array} endColor
	 */
	public var endColor:Array<Int>;
	
	/**
	 * The ending scale of all particles.
	 * @property {Number} endScale
	 * @default 1
	 */
	public var endScale:Float;
	
	/**
	 * The ending speed of all particles.
	 * @property {Number} endSpeed
	 * @default 0
	 */
	public var endSpeed:Float;
	
	/**
	 *	Extra data for use in custom particles. The emitter doesn't look inside, but
	 *	passes it on to the particle to use in init().
	 *	@property {Object} extraData
	 */
	public var extraData:Dynamic;
	
	/**
	 * Time between particle spawns in seconds. If this value is not a number greater than 0,
	 * it will be set to 1 (particle per second) to prevent infinite loops.
	 * @property {Number} frequency
	 */
	public var frequency:Float;
	
	/**
	 * The maximum lifetime for a particle, in seconds.
	 * @property {Number} maxLifetime
	 */
	public var maxLifetime:Float;
	
	/**
	 * Maximum number of particles to keep alive at a time. If this limit
	 * is reached, no more particles will spawn until some have died.
	 * @property {int} maxParticles
	 * @default 1000
	 */
	public var maxParticles:Int;
	
	/**
	 * The maximum rotation speed for a particle, in degrees per second.
	 * This only visually spins the particle, it does not change direction of movement.
	 * @property {Number} maxRotationSpeed
	 */
	public var maxRotationSpeed:Float;
	
	/**
	 * The maximum start rotation for a particle, in degrees. This value
	 * is ignored if the spawn type is "burst" or "arc".
	 * @property {Number} maxStartRotation
	 */
	public var maxStartRotation:Float;
	
	/**
	 * A minimum multiplier for the scale of a particle at both start and
	 * end. A value between minimumScaleMultiplier and 1 is randomly generated
	 * and multiplied with startScale and endScale to provide the actual
	 * startScale and endScale for each particle.
	 * @property {Number} minimumScaleMultiplier
	 * @default 1
	 */
	public var minimumScaleMultiplier:Float;
	
	/**
	 * The minimum lifetime for a particle, in seconds.
	 * @property {Number} minLifetime
	 */
	public var minLifetime:Float;
	
	/**
	 * The minimum rotation speed for a particle, in degrees per second.
	 * This only visually spins the particle, it does not change direction of movement.
	 * @property {Number} minRotationSpeed
	 */
	public var minRotationSpeed:Float;
	
	/**
	 * The minimum start rotation for a particle, in degrees. This value
	 * is ignored if the spawn type is "burst" or "arc".
	 * @property {Number} minStartRotation
	 */
	public var minStartRotation:Float;
	
	/**
	 * The world position of the emitter's owner, to add spawnPos to when
	 * spawning particles. To change this, use updateOwnerPos().
	 * @property {PIXI.Point} ownerPos
	 * @default {x:0, y:0}
	 * @readOnly
	 */
	public var ownerPos(default, null):Point;
	
	/**
	* The display object to add particles to. Settings this will dump any active particles.
	* @property {PIXI.DisplayObjectContainer} parent
	*/
	public var parent:Container;
	
	/**
	 * The blend mode for all particles, as named by PIXI.blendModes.
	 * @property {int} particleBlendMode
	 */
	public var particleBlendMode:Int;
	
	/**
	 * The constructor used to create new particles. The default is
	 * the built in Particle class. Setting this will dump any active or
	 * pooled particles, if the emitter has already been used.
	 * @property {Function} particleConstructor
	 */
	public var particleConstructor:Dynamic;
	
	/**
	 * The current number of active particles.
	 * @property {Int} particleCount
	 * @readOnly
	 */
	public var particleCount(default, null):Int;
	
	/**
	 * An array of PIXI Texture objects.
	 * @property {Array} particleImages
	 */
	public var particleImages:Array<Texture>;
	
	/**
	 * Spacing between particles in a burst. 0 gives a random angle for each particle.
	 * @property {Number} particleSpacing
	 * @default 0
	 */
	public var particleSpacing:Float;
	
	/**
	 * Number of particles to spawn each wave in a burst.
	 * @property {int} particlesPerWave
	 * @default 1
	 */
	public var particlesPerWave:Int;
	
	/**
	 * Rotation of the emitter or emitter's owner in degrees. This is added to
	 * the calculated spawn angle.
	 * To change this, use rotate().
	 * @property {Number} rotation
	 * @default 0
	 * @readOnly
	 */
	public var rotation(default, null):Float;
	
	/**
	 * A circle relative to spawnPos to spawn particles inside if the spawn type is "circle".
	 * @property {PIXI.Circle} spawnCircle
	 */
	public var spawnCircle:Circle;
	
	/**
	 * Position at which to spawn particles, relative to the emitter's owner's origin.
	 * For example, the flames of a rocket travelling right might have a spawnPos
	 * of {x:-50, y:0}.
	 * to spawn at the rear of the rocket.
	 * To change this, use updateSpawnPos().
	 * @property {PIXI.Point} spawnPos
	 * @readOnly
	 */
	public var spawnPos(default, null):Point;
	
	/**
	 * A rectangle relative to spawnPos to spawn particles inside if the spawn type is "rect".
	 * @property {PIXI.Rectangle} spawnRect
	 */
	public var spawnRect:Rectangle;
	
	/**
	 * How the particles will be spawned. Valid types are "point", "rectangle",
	 * "circle", "burst", "ring".
	 * @property {String} spawnType
	 * @readOnly
	 */
	public var spawnType(default, null):String;
	
	/**
	 * The starting alpha of all particles.
	 * @property {Number} startAlpha
	 * @default 1
	 */
	public var startAlpha:Float;
	
	/**
	 * The starting color of all particles, as red, green, and blue uints from 0-255.
	 * @property {Array} startColor
	 */
	public var startColor:Array<Int>;
	
	/**
	 * The starting scale of all particles.
	 * @property {Number} startScale
	 * @default 1
	 */
	public var startScale:Float;
	
	/**
	 * The starting speed of all particles.
	 * @property {Number} startSpeed
	 * @default 0
	 */
	public var startSpeed:Float;
	
	/**
	 * Kills all active particles immediately.
	 * @method cleanup
	 */
	public function cleanup():Void;
	
	/**
	 * Destroys the emitter and all of its particles.
	 * @method destroy
	 */
	public function destroy():Void;
	
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
