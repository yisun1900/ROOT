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
	String kpjlh=null;
	String qssj=null;
	String jzsj=null;
	String lrr=null;
	String lrsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and (kp_kpjl.fgs='"+fgs+"') ";
	}

	kpjlh=request.getParameter("kpjlh");
	if (kpjlh!=null)
	{
		kpjlh=kpjlh.trim();
		if (!(kpjlh.equals("")))	wheresql+=" and (kp_kpjl.kpjlh="+kpjlh+") ";
	}
	qssj=request.getParameter("qssj");
	if (qssj!=null)
	{
		qssj=qssj.trim();
		if (!(qssj.equals("")))	wheresql+="  and (kp_kpjl.qssj=TO_DATE('"+qssj+"','YYYY/MM/DD'))";
	}
	jzsj=request.getParameter("jzsj");
	if (jzsj!=null)
	{
		jzsj=jzsj.trim();
		if (!(jzsj.equals("")))	wheresql+="  and (kp_kpjl.jzsj=TO_DATE('"+jzsj+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (kp_kpjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (kp_kpjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (kp_kpjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT kpjlh,dwmc,qssj,jzsj,lrr,lrsj,kp_kpjl.bz  ";
	ls_sql+=" FROM kp_kpjl,sq_dwxx  ";
    ls_sql+=" where (kp_kpjl.fgs=sq_dwxx.dwbh(+))";
    ls_sql+=wheresql;
    ls_sql+=" order by kpjlh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_kpjlList.jsp","SelectKp_kpjl.jsp","","Kp_yzfsgdkpjgList.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kpjlh","qssj","jzsj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kpjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteKp_kpjlList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"kpjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="Kp_yzfsgdkpjgCxList.jsp";//Ϊ�в�����coluParm.link���ó�������
//	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("kpjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] kpjlh = request.getParameterValues("kpjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kpjlh,"kpjlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[6];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from kp_sgdkpjg where "+chooseitem;
		sql[1]="delete from kp_sgdpfb where "+chooseitem;
		sql[2]="delete from kp_kpcftj where "+chooseitem;
		sql[3]="delete from kp_kpkftj where "+chooseitem;
		sql[4]="delete from kp_gdpfb where "+chooseitem;
		sql[5]="delete from kp_kpjl where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="8%">������¼��</td>
	<td  width="10%">�ֹ�˾</td>
	<td  width="14%">������ʼʱ��</td>
	<td  width="14%">������ֹʱ��</td>
	<td  width="8%">¼����</td>
	<td  width="14%">¼��ʱ��</td>
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