<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.DBPageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

	
	
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String FItemID=null;
	FItemID=request.getParameter("FItemID");
	if (FItemID!=null)
	{
		if (!(FItemID.equals("")))	wheresql+=" and  (t_ICItem.FItemID='"+FItemID+"')";
	}
	String FModel=null;
	FModel=request.getParameter("FModel");
	if (FModel!=null)
	{
		if (!(FModel.equals("")))	wheresql+=" and  (t_ICItem.FModel='"+FModel+"')";
	}
	//��Ʒ����
	String FName=null;
	FName=request.getParameter("FName");
	if (FName!=null)
	{
		FName=cf.GB2Uni(FName);
		if (!(FName.equals("")))	wheresql+=" and  (t_ICItem.FName  like '%"+FName+"%')";
	}
	//�ⷿ����
	String FName2=null;
	FName2=request.getParameter("FName2");
	if (FName2!=null)
	{
		FName2=cf.GB2Uni(FName2);
		if (!(FName2.equals("")))	wheresql+=" and  (t_Stock.FName  like '%"+FName2+"%')";
	}
   //��λ����
	String FName3=null;
	FName3=request.getParameter("FName3");
	if (FName3!=null)
	{
		FName3=cf.GB2Uni(FName3);
		if (!(FName3.equals("")))	wheresql+=" and  (t_StockPlace.FName  like '%"+FName3+"%')";
	}
	

	//��λ����
	String FBatchNo=null;
	FBatchNo=request.getParameter("FBatchNo");
	if (FBatchNo!=null)
	{
		FBatchNo=cf.GB2Uni(FBatchNo);
		if (!(FBatchNo.equals("")))	wheresql+=" and  (ICInventory.FBatchNo  like '%"+FBatchNo+"%')";
	}




	ls_sql="SELECT b.FItemID FItemID,a.FName FName,a.FModel FModel, b.FBatchNo FBatchNo, b.FQty FQty,b.FQtyLock FQtyLock, b.FBal FBal,c.FName FName2,d.FName FName3";
	ls_sql+=" FROM t_ICItem a,ICInventory b,t_Stock c,t_StockPlace d ";
	ls_sql+=" where a.FItemID=b.FItemID  ";
	ls_sql+=" and b.FStockID=c.FItemID  ";
	ls_sql+=" and b.FStockPlaceID=d.FSPID  ";
	//ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh";
	//ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	//ls_sql+=" and jc_zcdd.clzt in('00','03','05')";
	
    ls_sql+=wheresql;
    ls_sql+=" order by b.FItemID";

//	System.out.println(ls_sql);

	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("ChList.jsp","","","","sqlserver","sa","");

/*
//������ʾ��
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"FItemID"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���--��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td >��Ʒ����</td>
	<td >��Ʒ����</td>
	<td >��Ʒ���</td>
	<td >����</td>
	<td >�������</td>
	<td >��������</td>
	<td >������</td>
    <td >�ⷿ����</td>
	<td >��λ����</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</table>
</form> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
