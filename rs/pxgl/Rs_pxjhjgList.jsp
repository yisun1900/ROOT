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
	String pxjhbh=null;
	String pxjhmc=null;
	String jhjg=null;
	String pxrs=null;
	String pxfy=null;
	String fgs=null;
	String jhzt=null;
	String lrr=null;
	String wclrr=null;
	String ssfgs=null;
	String lrsj=null;
	String wclrsj=null;
	String sjzprs=null;
	String sjzpfy=null;
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (rs_pxjhjg.pxjhbh='"+pxjhbh+"')";
	}
	pxjhmc=request.getParameter("pxjhmc");
	if (pxjhmc!=null)
	{
		pxjhmc=cf.GB2Uni(pxjhmc);
		if (!(pxjhmc.equals("")))	wheresql+=" and  (rs_pxjh.pxjhmc='"+pxjhmc+"')";
	}
	jhjg=request.getParameter("jhjg");
	if (jhjg!=null)
	{
		jhjg=cf.GB2Uni(jhjg);
		if (!(jhjg.equals("")))	wheresql+=" and  (rs_pxjhjg.jhjg='"+jhjg+"')";
	}
	pxrs=request.getParameter("pxrs");
	if (pxrs!=null)
	{
		pxrs=pxrs.trim();
		if (!(pxrs.equals("")))	wheresql+=" and (rs_pxjh.pxrs="+pxrs+") ";
	}
	pxfy=request.getParameter("pxfy");
	if (pxfy!=null)
	{
		pxfy=pxfy.trim();
		if (!(pxfy.equals("")))	wheresql+=" and  (rs_pxjh.pxfy="+pxfy+") ";
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
		if (!(fgs.equals("")))	wheresql+=" and  (rs_pxjh.fgs='"+fgs+"')";
	}
	jhzt=request.getParameter("jhzt");
	if (jhzt!=null)
	{
		jhzt=cf.GB2Uni(jhzt);
		if (!(jhzt.equals("")))	wheresql+=" and  (rs_pxjh.jhzt='"+jhzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (rs_pxjh.lrr='"+lrr+"')";
	}
	wclrr=request.getParameter("wclrr");
	if (wclrr!=null)
	{
		wclrr=cf.GB2Uni(wclrr);
		if (!(wclrr.equals("")))	wheresql+=" and  (rs_pxjhjg.lrr='"+wclrr+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_pxjh.ssfgs='"+ssfgs+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_pxjh.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_pxjh.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	wclrsj=request.getParameter("wclrsj");
	if (wclrsj!=null)
	{
		wclrsj=wclrsj.trim();
		if (!(wclrsj.equals("")))	wheresql+="  and (rs_pxjhjg.lrsj>=TO_DATE('"+wclrsj+"','YYYY/MM/DD'))";
	}
	wclrsj=request.getParameter("wclrsj2");
	if (wclrsj!=null)
	{
		wclrsj=wclrsj.trim();
		if (!(wclrsj.equals("")))	wheresql+="  and (rs_pxjhjg.lrsj<=TO_DATE('"+wclrsj+"','YYYY/MM/DD'))";
	}	
	ls_sql="SELECT rs_pxjhjg.pxjhbh pxjhbh,pxjhmc,sjpxrs,sjpxfy,pxrs,pxfy,DECODE(jhjg,'0','δ���','1','���','2','�������') jhjg,rs_pxjhjg.lrr lrr,rs_pxjhjg.lrsj lrsj ";
	ls_sql+=" FROM rs_pxjhjg,rs_pxjh  ";
    ls_sql+=" where rs_pxjhjg.pxjhbh=rs_pxjh.pxjhbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_pxjhjgList.jsp","SelectRs_pxjhjg.jsp","","EditRs_pxjhjg.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pxjhbh","sjpxrs","sjpxfy","sjkssj","sjjssj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pxjhbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_pxjhjgList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] pxjhbh = request.getParameterValues("pxjhbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pxjhbh,"pxjhbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[4];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from rs_pxjhjg where "+chooseitem;
		sql[1]="update rs_pxjh set jhzt='6' where "+chooseitem;
		sql[2]="delete from rs_pxzjmx where "+chooseitem;
		sql[3]="update rs_pxjhmx set mxwc=null where "+chooseitem;
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="9%">��ѵ�ƻ����</td>
	<td  width="16%">��ѵ�ƻ�����</td>
	<td  width="10%">ʵ����ѵ����</td>
	<td  width="10%">ʵ����ѵ����</td>
	<td  width="8%">�ƻ�����</td>
	<td  width="8%">�ƻ�����</td>
	<td  width="8%">�ƻ����</td>
	<td  width="9%">¼����</td>
	<td  width="9%">¼��ʱ��</td>
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