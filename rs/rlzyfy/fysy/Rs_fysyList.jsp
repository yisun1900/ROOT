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
	String fysybh=null;
	String hzbh=null;
	String fgs=null;
	String sysj=null;
	String sylx=null;
	String ytxs=null;
	String fy=null;
	String lrr=null;
	String lrsj=null;
	fysybh=request.getParameter("fysybh");
	if (fysybh!=null)
	{
		fysybh=cf.GB2Uni(fysybh);
		if (!(fysybh.equals("")))	wheresql+=" and  (fysybh='"+fysybh+"')";
	}
	hzbh=request.getParameter("hzbh");
	if (hzbh!=null)
	{
		hzbh=cf.GB2Uni(hzbh);
		if (!(hzbh.equals("")))	wheresql+=" and  (hzbh='"+hzbh+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (fgs='"+fgs+"')";
	}
	sysj=request.getParameter("sysj");
	if (sysj!=null)
	{
		sysj=sysj.trim();
		if (!(sysj.equals("")))	wheresql+="  and (sysj>=TO_DATE('"+sysj+"','YYYY/MM/DD'))";
	}
	sysj=request.getParameter("sysj2");
	if (sysj!=null)
	{
		sysj=sysj.trim();
		if (!(sysj.equals("")))	wheresql+="  and (sysj<=TO_DATE('"+sysj+"','YYYY/MM/DD'))";
	}
	sylx=request.getParameter("sylx");
	if (sylx!=null)
	{
		sylx=cf.GB2Uni(sylx);
		if (!(sylx.equals("")))	wheresql+=" and  (sylx='"+sylx+"')";
	}
	ytxs=request.getParameter("ytxs");
	if (ytxs!=null)
	{
		ytxs=cf.GB2Uni(ytxs);
		if (!(ytxs.equals("")))	wheresql+=" and  (ytxs='"+ytxs+"')";
	}
	fy=request.getParameter("fy");
	if (fy!=null)
	{
		fy=fy.trim();
		if (!(fy.equals("")))	wheresql+=" and  (fy="+fy+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT fysybh,hzbh,fgs,sysj, DECODE(sylx,'01','��Ƹ��','02','��ѵ��','03','������','04','������','05','��ᱣ�շ�','06','������','07','��������'),ytxs,fy,bz,lrr,lrsj  ";
	ls_sql+=" FROM rs_fysy  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_fysyList.jsp","SelectRs_fysy.jsp","","EditRs_fysy.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fysybh","hzbh","fgs","sysj","sylx","ytxs","fy","bz","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fysybh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_fysyList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] fysybh = request.getParameterValues("fysybh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fysybh,"fysybh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_fysy where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="8%">����ʹ�ñ��</td>
	<td  width="8%">Ԥ����</td>
	<td  width="8%">�ֹ�˾</td>
	<td  width="8%">ʹ��ʱ��</td>
	<td  width="8%">ʹ������</td>
	<td  width="8%">��;��ʽ</td>
	<td  width="8%">����</td>
	<td  width="8%">��ע</td>
	<td  width="8%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
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