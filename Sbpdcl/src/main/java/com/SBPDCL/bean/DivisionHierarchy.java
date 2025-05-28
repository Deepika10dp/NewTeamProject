package com.SBPDCL.bean;
public class DivisionHierarchy {
	 private Division division;
	    private SubDivision subdivision;
	    private Section section;
		public Division getDivision() {
			return division;
		}
		public void setDivision(Division division) {
			this.division = division;
		}
		public SubDivision getSubdivision() {
			return subdivision;
		}
		public void setSubdivision(SubDivision subdivision) {
			this.subdivision = subdivision;
		}
		public Section getSection() {
			return section;
		}
		public void setSection(Section section) {
			this.section = section;
		}
		@Override
		public String toString() {
			return "DivisionHierarchy [division=" + division + ", subdivision=" + subdivision + ", section=" + section
					+ "]";
		} 
}
