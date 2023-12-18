package egovframework.veterans.com.cmm.service.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class lockercodelist {
	private int PLockerID;
	private int PLockerGroupID;
    private String PLockerGroupName;
    private String PLockerLocation;
    private int PLockerNO;
    private String State;
    private int RepairID;
    private String MemberID;
    private String Name;
    private String RegMonth;
    private int SortOrder;
}
