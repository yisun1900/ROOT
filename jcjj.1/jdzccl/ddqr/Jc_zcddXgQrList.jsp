<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="DBpageObj" scope="session" class="ybl.common.DBPageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//��ĿרԱ����
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿӹ��ʹ���
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿ����ʦ����

if (zwbm.equals("10"))//10:��ĿרԱ
{
	if (xmzyglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:�Ҿӹ���
{
	if (jjgwglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:�Ҿ����ʦ
{
	if (jjsjsglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}

	
	
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (DBpageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (t_Organization.FNumber='"+khbh+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (t_Organization.FName='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (t_Organization.FName like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (t_Organization.FAddress='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (t_Organization.FAddress like '%"+fwdz2+"%')";
	}



	String ddbh=null;
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (SEOrder.FBillNo='"+ddbh+"')";
	}
	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (SEOrder.clzt='"+clzt+"')";
	}

	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (SEOrder.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql+=" and  (SEOrder.ppbm='"+ppbm2+"')";
	}

	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (SEOrder.clgw='"+clgw+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (SEOrder.xmzy='"+xmzy+"')";
	}

	String ddqrsj=null;
	ddqrsj=request.getParameter("ddqrsj");
	if (ddqrsj!=null)
	{
		ddqrsj=ddqrsj.trim();
		if (!(ddqrsj.equals("")))	wheresql+="  and (SEOrder.ddqrsj>=TO_DATE('"+ddqrsj+"','YYYY-MM-DD'))";
	}
	ddqrsj=request.getParameter("ddqrsj2");
	if (ddqrsj!=null)
	{
		ddqrsj=ddqrsj.trim();
		if (!(ddqrsj.equals("")))	wheresql+="  and (SEOrder.ddqrsj<=TO_DATE('"+ddqrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	ls_sql="SELECT SEOrder.fbillno,clztmc,CONVERT(char(10),SEOrder.ddqrsj,111 ),ppbm,t_Organization.fnumber khbh,t_Organization.FName,t_Organization.FAddress,SEOrder.clgw,SEOrder.xmzy ,CONVERT(char(10),SEOrder.FDate,111 ) ";
	ls_sql+=" FROM t_Organization,SEOrder,jdm_zcddzt ";
    ls_sql+=" where SEOrder.FCustID=t_Organization.FItemID";
    ls_sql+=" and SEOrder.clzt*=jdm_zcddzt.clzt ";
	if (zwbm.equals("08"))//08:�Ҿӹ���
	{
		ls_sql+=" and (SEOrder.clgw='"+yhmc+"' OR SEOrder.ztjjgw='"+yhmc+"' OR SEOrder.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("12"))//12:�Ҿ����ʦ
	{
		ls_sql+=" and (SEOrder.jjsjs='"+yhmc+"' OR SEOrder.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("10"))//10:��ĿרԱ
	{
		ls_sql+=" and (SEOrder.xmzy='"+yhmc+"' OR SEOrder.lrr='"+yhmc+"')";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by SEOrder.ddqrsj desc";

	DBpageObj.sql=ls_sql;
//���ж����ʼ��
	DBpageObj.initPage("Jc_zcddXgQrList.jsp","","","","sqlserver","sa","");
//	DBpageObj.setPageRow(300);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	DBpageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fbillno"};
	DBpageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ȷ����Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteQrJc_zcdd.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	DBpageObj.setButton(buttonName,buttonLink,buttonNew);


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	DBpageObj.setColuLink(coluParmHash);//�в����������Hash��

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
  <B><font size="3">���Ķ���������ɾ������ȷ��</font></B>
</CENTER>
<%
	DBpageObj.out=out;
	DBpageObj.getDate(curPage);
	DBpageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="8%">ȷ��ʱ��</td>
	<td  width="16%">Ʒ��</td>
	<td  width="8%">�ͻ����</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="20%">���ݵ�ַ</td>
	<td  width="7%">�Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="8%">��������</td>
</tr>
<%
	DBpageObj.displayDateSum();
	DBpageObj.displayFoot();
%> 

</table>
</form> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	DBpageObj.printScript();
%> 
//-->
</script>
