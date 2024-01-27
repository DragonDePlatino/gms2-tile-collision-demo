
/// @description How solid an object is when interacting with other objects.
enum Solidity {
	/// Object does not collide.
	NONE,
	/// Object is treated as a solid only when entering from the top.
	SEMISOLID,
	/// Object is treated as solid from all edges.
	SOLID
};

global.solidity_name = ["NONE", "SEMISOLID", "SOLID"];