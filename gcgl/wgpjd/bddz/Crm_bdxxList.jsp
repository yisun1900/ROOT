<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_bdxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_bdxx_yjdz=null;
	String crm_bdxx_yb=null;
	String crm_bdxx_sjr=null;
	String crm_bdxx_dh=null;
	String crm_bdxx_lrr=null;
	String crm_bdxx_lrsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	
	
	crm_bdxx_khbh=request.getParameter("crm_bdxx_khbh");
	if (crm_bdxx_khbh!=null)
	{
		crm_bdxx_khbh=cf.GB2Uni(crm_bdxx_khbh);
		if (!(crm_bdxx_khbh.equals("")))	wheresql+=" and  (crm_bdxx.khbh='"+crm_bdxx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_bdxx_yjdz=request.getParameter("crm_bdxx_yjdz");
	if (crm_bdxx_yjdz!=null)
	{
		crm_bdxx_yjdz=cf.GB2Uni(crm_bdxx_yjdz);
		if (!(crm_bdxx_yjdz.equals("")))	wheresql+=" and  (crm_bdxx.yjdz='"+crm_bdxx_yjdz+"')";
	}
	crm_bdxx_yb=request.getParameter("crm_bdxx_yb");
	if (crm_bdxx_yb!=null)
	{
		crm_bdxx_yb=cf.GB2Uni(crm_bdxx_yb);
		if (!(crm_bdxx_yb.equals("")))	wheresql+=" and  (crm_bdxx.yb='"+crm_bdxx_yb+"')";
	}
	crm_bdxx_sjr=request.getParameter("crm_bdxx_sjr");
	if (crm_bdxx_sjr!=null)
	{
		crm_bdxx_sjr=cf.GB2Uni(crm_bdxx_sjr);
		if (!(crm_bdxx_sjr.equals("")))	wheresql+=" and  (crm_bdxx.sjr='"+crm_bdxx_sjr+"')";
	}
	crm_bdxx_dh=request.getParameter("crm_bdxx_dh");
	if (crm_bdxx_dh!=null)
	{
		crm_bdxx_dh=cf.GB2Uni(crm_bdxx_dh);
		if (!(crm_bdxx_dh.equals("")))	wheresql+=" and  (crm_bdxx.dh='"+crm_bdxx_dh+"')";
	}
	crm_bdxx_lrr=request.getParameter("crm_bdxx_lrr");
	if (crm_bdxx_lrr!=null)
	{
		crm_bdxx_lrr=cf.GB2Uni(crm_bdxx_lrr);
		if (!(crm_bdxx_lrr.equals("")))	wheresql+=" and  (crm_bdxx.lrr='"+crm_bdxx_lrr+"')";
	}
	crm_bdxx_lrsj=request.getParameter("crm_bdxx_lrsj");
	if (crm_bdxx_lrsj!=null)
	{
		crm_bdxx_lrsj=crm_bdxx_lrsj.trim();
		if (!(crm_bdxx_lrsj.equals("")))	wheresql+="  and (crm_bdxx.lrsj>=TO_DATE('"+crm_bdxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_bdxx_lrsj=request.getParameter("crm_bdxx_lrsj2");
	if (crm_bdxx_lrsj!=null)
	{
		crm_bdxx_lrsj=crm_bdxx_lrsj.trim();
		if (!(crm_bdxx_lrsj.equals("")))	wheresql+="  and (crm_bdxx.lrsj<=TO_DATE('"+crm_bdxx_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_bdxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_bdxx.yjdz,crm_bdxx.yb,crm_bdxx.sjr,crm_bdxx.dh,crm_bdxx.bz  ";
	ls_sql+=" FROM crm_bdxx,crm_khxx  ";
    ls_sql+=" where crm_bdxx.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_bdxx.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_bdxxList.jsp","SelectCrm_bdxx.jsp","","EditCrm_bdxx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_bdxx_yjdz","crm_bdxx_yb","crm_bdxx_sjr","crm_bdxx_dh","crm_bdxx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_bdxxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_bdxx where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">�ͻ����</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="7%">��ͬ��</td>
	<td  width="6%">���ʦ</td>
	<td  width="15%">�ʼĵ�ַ</td>
	<td  width="7%">�ʱ�</td>
	<td  width="6%">�ռ���</td>
	<td  width="11%">�绰</td>
	<td  width="14%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>