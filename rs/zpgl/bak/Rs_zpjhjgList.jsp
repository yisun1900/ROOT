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
	String zpjhbh=null;
	String zprs=null;
	String zpfy=null;
	String sjzprs=null;
	String sjzpfy=null;
	String fgs=null;
	String jhzt=null;
	String jhkssj=null;
	String jhjssj=null;
	String sjkssj=null;
	String sjjssj=null;
	String lrr=null;
	String wclrr=null;
	String ssfgs=null;
	String lrsj=null;
	String wclrsj=null;

	zpjhbh=request.getParameter("zpjhbh");
	if (zpjhbh!=null)
	{
		zpjhbh=cf.GB2Uni(zpjhbh);
		if (!(zpjhbh.equals("")))	wheresql+=" and  (rs_zpjhjg.zpjhbh='"+zpjhbh+"')";
	}
	zprs=request.getParameter("zprs");
	if (zprs!=null)
	{
		zprs=zprs.trim();
		if (!(zprs.equals("")))	wheresql+=" and (rs_zpjh.zprs="+zprs+") ";
	}
	zpfy=request.getParameter("zpfy");
	if (zpfy!=null)
	{
		zpfy=zpfy.trim();
		if (!(zpfy.equals("")))	wheresql+=" and  (rs_zpjh.zpfy="+zpfy+") ";
	}
	sjzprs=request.getParameter("sjzprs");
	if (sjzprs!=null)
	{
		sjzprs=sjzprs.trim();
		if (!(sjzprs.equals("")))	wheresql+=" and (rs_zpjhjg.sjzprs="+sjzprs+") ";
	}
	sjzpfy=request.getParameter("sjzpfy");
	if (sjzpfy!=null)
	{
		sjzpfy=sjzpfy.trim();
		if (!(sjzpfy.equals("")))	wheresql+=" and  (rs_zpjhjg.sjzpfy="+sjzpfy+") ";
	}


	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (rs_zpjh.fgs='"+fgs+"')";
	}
	jhzt=request.getParameter("jhzt");
	if (jhzt!=null)
	{
		jhzt=cf.GB2Uni(jhzt);
		if (!(jhzt.equals("")))	wheresql+=" and  (rs_zpjh.jhzt='"+jhzt+"')";
	}
	jhkssj=request.getParameter("jhkssj");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (rs_zpjh.jhkssj>=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhkssj=request.getParameter("jhkssj2");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (rs_zpjh.jhkssj<=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (rs_zpjh.jhjssj>=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj2");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (rs_zpjh.jhjssj<=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	sjkssj=request.getParameter("sjkssj");
	if (sjkssj!=null)
	{
		sjkssj=sjkssj.trim();
		if (!(sjkssj.equals("")))	wheresql+="  and (rs_zpjhjg.sjkssj>=TO_DATE('"+sjkssj+"','YYYY/MM/DD'))";
	}
	sjkssj=request.getParameter("sjkssj2");
	if (sjkssj!=null)
	{
		sjkssj=sjkssj.trim();
		if (!(sjkssj.equals("")))	wheresql+="  and (rs_zpjhjg.sjkssj<=TO_DATE('"+sjkssj+"','YYYY/MM/DD'))";
	}
	sjjssj=request.getParameter("sjjssj");
	if (sjjssj!=null)
	{
		sjjssj=sjjssj.trim();
		if (!(sjjssj.equals("")))	wheresql+="  and (rs_zpjhjg.sjjssj>=TO_DATE('"+sjjssj+"','YYYY/MM/DD'))";
	}
	sjjssj=request.getParameter("sjjssj2");
	if (sjjssj!=null)
	{
		sjjssj=sjjssj.trim();
		if (!(sjjssj.equals("")))	wheresql+="  and (rs_zpjhjg.sjjssj<=TO_DATE('"+sjjssj+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (rs_zpjh.lrr='"+lrr+"')";
	}
	wclrr=request.getParameter("wclrr");
	if (wclrr!=null)
	{
		wclrr=cf.GB2Uni(wclrr);
		if (!(wclrr.equals("")))	wheresql+=" and  (rs_zpjhjg.lrr='"+wclrr+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_zpjh.ssfgs='"+ssfgs+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_zpjh.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_zpjh.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	wclrsj=request.getParameter("wclrsj");
	if (wclrsj!=null)
	{
		wclrsj=wclrsj.trim();
		if (!(wclrsj.equals("")))	wheresql+="  and (rs_zpjhjg.lrsj>=TO_DATE('"+wclrsj+"','YYYY/MM/DD'))";
	}
	wclrsj=request.getParameter("wclrsj2");
	if (wclrsj!=null)
	{
		wclrsj=wclrsj.trim();
		if (!(wclrsj.equals("")))	wheresql+="  and (rs_zpjhjg.lrsj<=TO_DATE('"+wclrsj+"','YYYY/MM/DD'))";
	}	
	ls_sql="SELECT rs_zpjhjg.zpjhbh zpjhbh,sjzprs,sjzpfy,sjkssj,sjjssj,rs_zpjhjg.lrr lrr,rs_zpjhjg.lrsj lrsj ";
	ls_sql+=" FROM rs_zpjhjg,rs_zpjh  ";
    ls_sql+=" where rs_zpjhjg.zpjhbh=rs_zpjh.zpjhbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_zpjhjgList.jsp","SelectRs_zpjhjg.jsp","","EditRs_zpjhjg.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zpjhbh","sjzprs","sjzpfy","sjkssj","sjjssj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zpjhbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_zpjhjgList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] zpjhbh = request.getParameterValues("zpjhbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zpjhbh,"zpjhbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from rs_zpjhjg where "+chooseitem;
		sql[1]="update rs_zpjh set jhzt='6' where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="12%">��Ƹ�ƻ����</td>
	<td  width="12%">ʵ����Ƹ����</td>
	<td  width="12%">ʵ����Ƹ����</td>
	<td  width="14%">ʵ����Ƹ��ʼʱ��</td>
	<td  width="14%">ʵ����Ƹ����ʱ��</td>
	<td  width="10%">¼����</td>
	<td  width="14%">¼��ʱ��</td>
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