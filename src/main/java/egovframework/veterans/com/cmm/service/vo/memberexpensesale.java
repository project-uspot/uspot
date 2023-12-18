package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class memberexpensesale {

	private String ExpenseGroupName;
	private String ExpenseName;
	private String InOut;
	private String SaleDate;
	private int Price;
	private int DefPrice;
	private int minabPrice;
}
