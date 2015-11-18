
var meArray = [ "Karen", "Renee", "Hunter"];
//console.log(meArray[0]);
//console.log(typeof meArray);

//console.log("TryMe with Parens " + tryMe());
//console.log("TryMe without Parens " + tryMe);

function tryMe() {
  return 2 + 2;
}

// Object
var me = {
  fname: "Karen",
  lname: "Hunter",
  mname: "Renee",
  isMarried: true,
  fullname: function () {
	console.log(me.fname + " " + me.mname + " " +  me.lname);
   },
  displayMS: function () {
        me.fullname();
	console.log( "is Married: " + me.isMarried);
   }
};

//me.displayMS();

(function() { 
var a= b= 5;
})();

//console.log(b); // Trick: b is global scope without 'use strict'


// Class Construction
function Family(fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.relation;
  this.getRelation= function() {
	return this.relation;
  },
  this.setRelation= function(rel) {
	this.relation = rel;	
  },
  this.whoAmI = function() {
	return fname + " " + lname + ", Relation: " + this.getRelation();
  }
}

var me = new Family("Karen", "Hunter");
me.setRelation("Me");
console.log(me.whoAmI());

var t = new Family("Terence", "Hunter");
t.setRelation("Husband");
var t1 = t.whoAmI; // creating a function of Object Family

console.log( "Does t1 === t ? : " + t.whoAmI === t1 );
console.log(t1.call(t));
console.log(t1);

// SubClass of Family
function Cousin(fname, lname) {
    // call Parent constructor
    Family.call(this, fname, lname);
}

var c1 = new Cousin("Michelle", "Hammond");
c1.setRelation("Cousin");
console.log(c1.whoAmI());
var isFamily=(c1 instanceof Family);
console.log("is c1 and instanceof Family? " + isFamily);
var isFamily=(c1 instanceof Cousin);
console.log("Is "+c1.fname +"an instanceof Cousin? " + isFamily );

var isFamily=(Cousin instanceof Family);
console.log("Is Cousin an instanceof Family " + isFamily); // false

Cousin.prototype = Object.create(Family.prototype);
Cousin.prototype.constructor = Cousin;
var isFamily=(Cousin instanceof Family);
console.log("Is Cousin an instanceof Family " + isFamily); 
var c2 = new Cousin("Shirley","Chisham");
var isFamily=(c2 instanceof Family);
console.log("Is " + c2.fname + " an instanceof Family " + isFamily); // now is true


