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


	String FBillNo=null;
	FBillNo=request.getParameter("FBillNo");
	if (FBillNo!=null)
	{
		if (!(FBillNo.equals("")))	wheresql+=" and  (SEOrder.FBillNo='"+FBillNo+"')";
	}
	
	
	String FName=null;
	FName=request.getParameter("FName");
	if (FName!=null)
	{
		FName=cf.GB2Uni(FName);
		if (!(FName.equals("")))	wheresql+=" and  (t_Organization.FName  like '%"+FName+"%') or (t_Organization.FNameEN  like '%"+FName+"%')";
	}
	
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (SEOrder.clgw  like '%"+clgw+"%')";
	}

	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (SEOrder.xmzy  like '%"+xmzy+"%')";
	}

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (SEOrder.ztjjgw  like '%"+ztjjgw+"%')";
	}

	String ddqrr=null;
	ddqrr=request.getParameter("ddqrr");
	if (ddqrr!=null)
	{
		ddqrr=cf.GB2Uni(ddqrr);
		if (!(ddqrr.equals("")))	wheresql+=" and  (SEOrder.ddqrr  like '%"+ddqrr+"%')";
	}
  
	
	//����ʱ��
	String FDate=null;
	FDate=request.getParameter("FDate");
	if (FDate!=null)
	{
		if (!(FDate.equals("")))	wheresql+="  and (SEOrder.FDate>=cast('"+FDate+"' as datetime))";
	}
	FDate=request.getParameter("FDate2");
	if (FDate!=null)
	{
		if (!(FDate.equals("")))	wheresql+="  and (SEOrder.FDate<=cast('"+FDate+"' as datetime))";
	}
	
	//����ȷ��ʱ��
	String ddqrsj=null;
	ddqrsj=request.getParameter("ddqrsj");
	if (ddqrsj!=null)
	{
		if (!(ddqrsj.equals("")))	wheresql+="  and (SEOrder.ddqrsj>=cast('"+ddqrsj+"' as datetime))";
	}
	ddqrsj=request.getParameter("ddqrsj2");
	if (ddqrsj!=null)
	{
		if (!(ddqrsj.equals("")))	wheresql+="  and (SEOrder.ddqrsj<=cast('"+ddqrsj+"' as datetime))";
	}
	//�ƻ�����ʱ��
	String jhclsj=null;
	jhclsj=request.getParameter("jhclsj");
	if (jhclsj!=null)
	{
		if (!(jhclsj.equals("")))	wheresql+="  and (SEOrder.jhclsj>=cast('"+jhclsj+"' as datetime))";
	}
	jhclsj=request.getParameter("jhclsj2");
	if (jhclsj!=null)
	{
		if (!(jhclsj.equals("")))	wheresql+="  and (SEOrder.jhclsj<=cast('"+jhclsj+"' as datetime))";
	}
	//ʵ�ʲ���ʱ��
	String sjclsj=null;
	sjclsj=request.getParameter("sjclsj");
	if (sjclsj!=null)
	{
		if (!(sjclsj.equals("")))	wheresql+="  and (SEOrder.sjclsj>=cast('"+sjclsj+"' as datetime))";
	}
	sjclsj=request.getParameter("sjclsj2");
	if (sjclsj!=null)
	{
		if (!(sjclsj.equals("")))	wheresql+="  and (SEOrder.sjclsj<=cast('"+sjclsj+"' as datetime))";
	}
	//�ƻ��ͻ�ʱ��
	String htshsj=null;
	htshsj=request.getParameter("htshsj");
	if (htshsj!=null)
	{
		if (!(htshsj.equals("")))	wheresql+="  and (SEOrder.htshsj>=cast('"+htshsj+"' as datetime))";
	}
	htshsj=request.getParameter("htshsj2");
	if (htshsj!=null)
	{
		if (!(htshsj.equals("")))	wheresql+="  and (SEOrder.htshsj<=cast('"+htshsj+"' as datetime))";
	}
	//�ƻ��ͻ�ʱ��
	String jhshsj=null;
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		if (!(jhshsj.equals("")))	wheresql+="  and (SEOrder.jhshsj>=cast('"+jhshsj+"' as datetime))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		if (!(jhshsj.equals("")))	wheresql+="  and (SEOrder.jhshsj<=cast('"+jhshsj+"' as datetime))";
	}
	//֪ͨ�ͻ�ʱ��
	String tzshsj=null;
	tzshsj=request.getParameter("tzshsj");
	if (tzshsj!=null)
	{
		tzshsj=tzshsj.trim();
		if (!(tzshsj.equals("")))	wheresql+="  and (SEOrder.tzshsj>=cast('"+tzshsj+"' as datetime))";
	}
	tzshsj=request.getParameter("tzshsj2");
	if (tzshsj!=null)
	{
		tzshsj=tzshsj.trim();
		if (!(tzshsj.equals("")))	wheresql+="  and (SEOrder.tzshsj<=cast('"+tzshsj+"' as datetime))";
	}
	//ʵ���ͻ�ʱ��
	String sshsj=null;
	sshsj=request.getParameter("sshsj");
	if (sshsj!=null)
	{
		sshsj=sshsj.trim();
		if (!(sshsj.equals("")))	wheresql+="  and (SEOrder.sshsj>=cast('"+sshsj+"' as datetime))";
	}
	sshsj=request.getParameter("sshsj2");
	if (sshsj!=null)
	{
		sshsj=sshsj.trim();
		if (!(sshsj.equals("")))	wheresql+="  and (SEOrder.sshsj<=cast('"+sshsj+"' as datetime))";
	}



	ls_sql="SELECT   '<a href =\"ViewOrderEntry.jsp?FBillNo='||FBillNo||'\" target=\"_back\">'||FBillNo||'</a>' FBillNo,FName,FDate,clgw,ztjjgw,xmzy,ddqrr,ddqrsj,gysjslrr,gysjslrsj,jhclsj,tzclsj,cltzr,sclsj,sclr,htshsj,jhshsj,tzry,tzshsj,tzshr,shtzsm,sshsj,sshr,shqk,tztbhsj,tztbhr,tbhtzry,jhtbhsj,stbhsj,stbhr,tbhqk,ycyybm,ycsm,ycclzt,zsycyybm,ychsqk,ychsr,ychssj,clzt,lsclzt,wjlrr,wjsj,sfydy,dysj";
	ls_sql+=" FROM SEOrder ,t_Organization  ";
	ls_sql+=" where FCustID=FNumber ";
	
	//ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh";
	//ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	//ls_sql+=" and jc_zcdd.clzt in('00','03','05')";
	
    ls_sql+=wheresql;
    ls_sql+=" order by FBillNo";

	System.out.println(ls_sql);

	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("DdList.jsp","","","","sqlserver","sa","");

/*
//������ʾ��
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","xmzy","jkxz","jkdd","ddshbz","hkze","xclbz","clzt","lrsj","dwbh","bz","xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"FBillNo"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"FBillNo"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewOrderEntry.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("FBillNo",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
*/	
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
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td nowrap >�������</td>
	<td nowrap>�ͻ�����</td>
	<td nowrap>��������</td>
	<td nowrap>פ��Ҿӹ���</td>
<td nowrap>չ���Ҿӹ���</td>
<td nowrap>��ĿרԱ</td>
<td nowrap>����ȷ����</td>
<td nowrap>����ȷ��ʱ��</td>
<td nowrap>��Ӧ�̽���¼����</td>
<td nowrap>��Ӧ�̽���¼��ʱ��</td>

<td nowrap>�ƻ�����ʱ��</td>
<td nowrap>֪ͨ����ʱ��</td>
<td nowrap>����֪ͨ��</td>
<td nowrap>ʵ����ʱ��</td>
<td nowrap>ʵ������</td>
<td nowrap>��ͬ�ͻ�ʱ��</td>
<td nowrap>�ƻ��ͻ�ʱ��</td>
<td nowrap>֪ͨ�ͻ���Ա</td>
<td nowrap>���ͻ�֪ͨʱ��</td>
<td nowrap>���ͻ�֪ͨ��</td>
<td nowrap>�ͻ�֪ͨ˵��</td>
<td nowrap>ʵ�ͻ�ʱ��</td>
<td nowrap>ʵ�ͻ���</td>
<td nowrap>�ͻ����</td>
<td nowrap>���˲���֪ͨʱ��</td>
<td nowrap>���˲���֪ͨ��</td>
<td nowrap>�˲���֪ͨ��Ա</td>
<td nowrap>Լ���˲���ʱ��</td>
<td nowrap>ʵ�˲���ʱ��</td>
<td nowrap>ʵ�˲�����</td>
<td nowrap>�˲������</td>
<td nowrap>�ӳ�ԭ�����</td>
<td nowrap>�ӳ�˵��</td>
<td nowrap>�ӳٴ���״̬</td>
<td nowrap>��ʵ�ӳ�ԭ�����</td>
<td nowrap>�ӳٺ�ʵ���</td>
<td nowrap>�ӳٺ�ʵ��</td>
<td nowrap>�ӳٺ�ʵʱ��</td>

<td nowrap>����״̬</td>
<td nowrap>��ʱ����״̬</td>
<td nowrap>���¼����</td>
<td nowrap>���ʱ��</td>
<td nowrap>�Ƿ��Ѵ�ӡ</td>
<td nowrap>��ӡʱ��</td>

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
