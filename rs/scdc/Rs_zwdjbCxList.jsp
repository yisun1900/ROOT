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
	String rs_zwdjb_djxmbh=null;
	String rs_zwdjb_djxm=null;
	String rs_zwdjb_gj=null;
	String rs_zwdjb_djjg=null;
	String rs_zwdjb_ygbh=null;
	String rs_zwdjb_yhmc=null;
	String rs_zwdjb_lrsj=null;
	String rs_zwdjb_lrbm=null;
	String rs_zwdjb_ssfgs=null;
	rs_zwdjb_djxmbh=request.getParameter("rs_zwdjb_djxmbh");
	if (rs_zwdjb_djxmbh!=null)
	{
		rs_zwdjb_djxmbh=cf.GB2Uni(rs_zwdjb_djxmbh);
		if (!(rs_zwdjb_djxmbh.equals("")))	wheresql+=" and  (rs_zwdjb.djxmbh='"+rs_zwdjb_djxmbh+"')";
	}
	rs_zwdjb_djxm=request.getParameter("rs_zwdjb_djxm");
	if (rs_zwdjb_djxm!=null)
	{
		rs_zwdjb_djxm=cf.GB2Uni(rs_zwdjb_djxm);
		if (!(rs_zwdjb_djxm.equals("")))	wheresql+=" and  (rs_zwdjb.djxm='"+rs_zwdjb_djxm+"')";
	}
	rs_zwdjb_gj=request.getParameter("rs_zwdjb_gj");
	if (rs_zwdjb_gj!=null)
	{
		rs_zwdjb_gj=cf.GB2Uni(rs_zwdjb_gj);
		if (!(rs_zwdjb_gj.equals("")))	wheresql+=" and  (rs_zwdjb.gj='"+rs_zwdjb_gj+"')";
	}
	rs_zwdjb_djjg=request.getParameter("rs_zwdjb_djjg");
	if (rs_zwdjb_djjg!=null)
	{
		rs_zwdjb_djjg=cf.GB2Uni(rs_zwdjb_djjg);
		if (!(rs_zwdjb_djjg.equals("")))	wheresql+=" and  (rs_zwdjb.djjg='"+rs_zwdjb_djjg+"')";
	}
	rs_zwdjb_ygbh=request.getParameter("rs_zwdjb_ygbh");
	if (rs_zwdjb_ygbh!=null)
	{
		rs_zwdjb_ygbh=rs_zwdjb_ygbh.trim();
		if (!(rs_zwdjb_ygbh.equals("")))	wheresql+=" and (rs_zwdjb.ygbh="+rs_zwdjb_ygbh+") ";
	}
	rs_zwdjb_yhmc=request.getParameter("rs_zwdjb_yhmc");
	if (rs_zwdjb_yhmc!=null)
	{
		rs_zwdjb_yhmc=cf.GB2Uni(rs_zwdjb_yhmc);
		if (!(rs_zwdjb_yhmc.equals("")))	wheresql+=" and  (rs_zwdjb.yhmc='"+rs_zwdjb_yhmc+"')";
	}
	rs_zwdjb_lrsj=request.getParameter("rs_zwdjb_lrsj");
	if (rs_zwdjb_lrsj!=null)
	{
		rs_zwdjb_lrsj=rs_zwdjb_lrsj.trim();
		if (!(rs_zwdjb_lrsj.equals("")))	wheresql+="  and (rs_zwdjb.lrsj=TO_DATE('"+rs_zwdjb_lrsj+"','YYYY/MM/DD'))";
	}
	rs_zwdjb_lrbm=request.getParameter("rs_zwdjb_lrbm");
	if (rs_zwdjb_lrbm!=null)
	{
		rs_zwdjb_lrbm=cf.GB2Uni(rs_zwdjb_lrbm);
		if (!(rs_zwdjb_lrbm.equals("")))	wheresql+=" and  (rs_zwdjb.lrbm='"+rs_zwdjb_lrbm+"')";
	}
	rs_zwdjb_ssfgs=request.getParameter("rs_zwdjb_ssfgs");
	if (rs_zwdjb_ssfgs!=null)
	{
		rs_zwdjb_ssfgs=cf.GB2Uni(rs_zwdjb_ssfgs);
		if (!(rs_zwdjb_ssfgs.equals("")))	wheresql+=" and  (rs_zwdjb.ssfgs='"+rs_zwdjb_ssfgs+"')";
	}

	String myxssl=null;
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");
	
	
	ls_sql="SELECT rs_zwdjb.djxmbh,rs_zwdjb.djxm,rs_zwdjb.gj, DECODE(rs_zwdjb.djjg,'1','��','2','��','3','������'),rs_zwdjb.ygbh,rs_zwdjb.yhmc,rs_zwdjb.lrsj,sq_dwxx.dwmc,rs_zwdjb.bz  ";
	ls_sql+=" FROM sq_dwxx,rs_zwdjb  ";
    ls_sql+=" where rs_zwdjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_zwdjb.ssfgs,rs_zwdjb.lrbm,rs_zwdjb.yhmc,rs_zwdjb.djxmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_zwdjbCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"djxmbh","rs_zwdjb_djxm","rs_zwdjb_gj","rs_zwdjb_djjg","ygbh","rs_zwdjb_yhmc","rs_zwdjb_lrsj","sq_dwxx_dwmc","rs_zwdjb_ssfgs","rs_zwdjb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djxmbh","ygbh"};
	pageObj.setKey(keyName);
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ҵ����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�����Ŀ���</td>
	<td  width="25%">�����Ŀ</td>
	<td  width="10%">����</td>
	<td  width="6%">�����</td>
	<td  width="6%">Ա�����</td>
	<td  width="6%">Ա������</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="10%">¼�벿��</td>

	<td  width="10%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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