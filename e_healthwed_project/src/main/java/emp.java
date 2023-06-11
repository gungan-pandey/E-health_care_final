import java.util.ArrayList;
import java.util.List;

public class emp {

	//String empName;
	int empId;
	emp(int id)
	{
		this.empId=id;
	}
	List<emp> emp1 = new ArrayList<>();
	
	public static void main(String arg[])
	{
		List<emp> emp1 = new ArrayList<>();
		emp e=new emp(1);
		emp e1=new emp(2);
	      emp1.add(e);
	      emp1.add(e1);
	  
	  
	for(emp ss:emp1)
	{

		System.out.println(e.empId);
		
	}
	
}
}
