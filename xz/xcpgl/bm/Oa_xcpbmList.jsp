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
	String oa_xcpbm_xcpbm=null;
	String oa_xcpbm_xcpmc=null;
	String[] oa_xcpbm_xcpflbm=null;
	String oa_xcpbm_jldw=null;
	String oa_xcpbm_dj=null;
	String oa_xcpbm_sfxsp=null;
	String oa_xcpbm_xh=null;

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (oa_xcpbm.dwbh='"+dwbh+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (oa_xcpbm.lrr='"+lrr+"')";
	}
	
	String oa_xcpbm_fgsbh=null;
	oa_xcpbm_xcpbm=request.getParameter("oa_xcpbm_xcpbm");
	if (oa_xcpbm_xcpbm!=null)
	{
		oa_xcpbm_xcpbm=cf.GB2Uni(oa_xcpbm_xcpbm);
		if (!(oa_xcpbm_xcpbm.equals("")))	wheresql+=" and  (oa_xcpbm.xcpbm='"+oa_xcpbm_xcpbm+"')";
	}
	oa_xcpbm_xcpmc=request.getParameter("oa_xcpbm_xcpmc");
	if (oa_xcpbm_xcpmc!=null)
	{
		oa_xcpbm_xcpmc=cf.GB2Uni(oa_xcpbm_xcpmc);
		if (!(oa_xcpbm_xcpmc.equals("")))	wheresql+=" and  (oa_xcpbm.xcpmc like '%"+oa_xcpbm_xcpmc+"%')";
	}
	oa_xcpbm_xcpflbm=request.getParameterValues("oa_xcpbm_xcpflbm");
	if (oa_xcpbm_xcpflbm!=null)
	{
		wheresql+=cf.arrayToSQL(oa_xcpbm_xcpflbm,"oa_xcpbm.xcpflbm");
	}
	oa_xcpbm_jldw=request.getParameter("oa_xcpbm_jldw");
	if (oa_xcpbm_jldw!=null)
	{
		oa_xcpbm_jldw=cf.GB2Uni(oa_xcpbm_jldw);
		if (!(oa_xcpbm_jldw.equals("")))	wheresql+=" and  (oa_xcpbm.jldw='"+oa_xcpbm_jldw+"')";
	}
	oa_xcpbm_dj=request.getParameter("oa_xcpbm_dj");
	if (oa_xcpbm_dj!=null)
	{
		oa_xcpbm_dj=oa_xcpbm_dj.trim();
		if (!(oa_xcpbm_dj.equals("")))	wheresql+=" and  (oa_xcpbm.dj="+oa_xcpbm_dj+") ";
	}
	oa_xcpbm_sfxsp=request.getParameter("oa_xcpbm_sfxsp");
	if (oa_xcpbm_sfxsp!=null)
	{
		oa_xcpbm_sfxsp=cf.GB2Uni(oa_xcpbm_sfxsp);
		if (!(oa_xcpbm_sfxsp.equals("")))	wheresql+=" and  (oa_xcpbm.sfxsp='"+oa_xcpbm_sfxsp+"')";
	}
	oa_xcpbm_xh=request.getParameter("oa_xcpbm_xh");
	if (oa_xcpbm_xh!=null)
	{
		oa_xcpbm_xh=oa_xcpbm_xh.trim();
		if (!(oa_xcpbm_xh.equals("")))	wheresql+=" and (oa_xcpbm.xh="+oa_xcpbm_xh+") ";
	}
	oa_xcpbm_fgsbh=request.getParameter("oa_xcpbm_fgsbh");
	if (oa_xcpbm_fgsbh!=null)
	{
		oa_xcpbm_fgsbh=cf.GB2Uni(oa_xcpbm_fgsbh);
		if (!(oa_xcpbm_fgsbh.equals("")))	wheresql+=" and  (oa_xcplqfw.fgsbh='"+oa_xcpbm_fgsbh+"')";
	}
	ls_sql="SELECT oa_xcpbm.xcpbm,oa_xcpbm.xcpmc,xcpflmc,oa_xcpbm.jldw,oa_xcpbm.dj, DECODE(oa_xcpbm.sfxsp,'N','����Ҫ','Y','��Ҫ') sfxsp,oa_xcpbm.xh,sq_dwxx.dwmc,oa_xcpbm.bz  ";
	ls_sql+=" FROM oa_xcpbm,sq_dwxx,oa_xcpflbm,oa_xcplqfw  ";
    ls_sql+=" where oa_xcpbm.xcpflbm=oa_xcpflbm.xcpflbm(+)";
    ls_sql+=" and oa_xcpbm.xcpbm=oa_xcplqfw.xcpbm and  oa_xcplqfw.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by oa_xcpbm.xcpbm,oa_xcplqfw.fgsbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Oa_xcpbmList.jsp","SelectOa_xcpbm.jsp","","EditOa_xcpbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xcpbm","oa_xcpbm_xcpmc","oa_xcpbm_xcpflbm","oa_xcpbm_jldw","oa_xcpbm_dj","oa_xcpbm_sfxsp","oa_xcpbm_xh","sq_dwxx_dwmc","oa_xcpbm_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xcpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Oa_xcpbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xcpbm","1");//�в����������Hash��
	spanColHash.put("xcpmc","1");//�в����������Hash��
	spanColHash.put("xcpflmc","1");//�в����������Hash��
	spanColHash.put("jldw","1");//�в����������Hash��
	spanColHash.put("dj","1");//�в����������Hash��
	spanColHash.put("sfxsp","1");//�в����������Hash��
	spanColHash.put("xh","1");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xcpbm = request.getParameterValues("xcpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xcpbm,"xcpbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from oa_xcplqfw where "+chooseitem;
		sql[1]="delete from oa_xcpbm where "+chooseitem;
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
	<td  width="7%">ӡˢƷ����</td>
	<td  width="16%">ӡˢƷ����</td>
	<td  width="15%">ӡˢƷ����</td>
	<td  width="8%">������λ</td>
	<td  width="7%">����</td>
	<td  width="7%">�Ƿ�������</td>
	<td  width="6%">���</td>
	<td  width="13%">����ȡ�ֹ�˾</td>
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