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
	String oa_bgypbm_bgypbm=null;
	String oa_bgypbm_bgypmc=null;
	String oa_bgypbm_flbm=null;
	String oa_bgypbm_jldw=null;
	String oa_bgypbm_dj=null;
	String oa_bgypbm_pp=null;
	String oa_bgypbm_xh=null;
	String oa_bgypbm_ghs=null;
	
	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (oa_bgypbm.fgsbh='"+fgsbh+"')";
	}

	oa_bgypbm_bgypbm=request.getParameter("oa_bgypbm_bgypbm");
	if (oa_bgypbm_bgypbm!=null)
	{
		oa_bgypbm_bgypbm=cf.GB2Uni(oa_bgypbm_bgypbm);
		if (!(oa_bgypbm_bgypbm.equals("")))	wheresql+=" and  (oa_bgypbm.bgypbm='"+oa_bgypbm_bgypbm+"')";
	}
	oa_bgypbm_bgypmc=request.getParameter("oa_bgypbm_bgypmc");
	if (oa_bgypbm_bgypmc!=null)
	{
		oa_bgypbm_bgypmc=cf.GB2Uni(oa_bgypbm_bgypmc);
		if (!(oa_bgypbm_bgypmc.equals("")))	wheresql+=" and  (oa_bgypbm.bgypmc='"+oa_bgypbm_bgypmc+"')";
	}
	oa_bgypbm_flbm=request.getParameter("oa_bgypbm_flbm");
	if (oa_bgypbm_flbm!=null)
	{
		oa_bgypbm_flbm=cf.GB2Uni(oa_bgypbm_flbm);
		if (!(oa_bgypbm_flbm.equals("")))	wheresql+=" and  (oa_bgypbm.flbm='"+oa_bgypbm_flbm+"')";
	}
	oa_bgypbm_jldw=request.getParameter("oa_bgypbm_jldw");
	if (oa_bgypbm_jldw!=null)
	{
		oa_bgypbm_jldw=cf.GB2Uni(oa_bgypbm_jldw);
		if (!(oa_bgypbm_jldw.equals("")))	wheresql+=" and  (oa_bgypbm.jldw='"+oa_bgypbm_jldw+"')";
	}
	oa_bgypbm_dj=request.getParameter("oa_bgypbm_dj");
	if (oa_bgypbm_dj!=null)
	{
		oa_bgypbm_dj=oa_bgypbm_dj.trim();
		if (!(oa_bgypbm_dj.equals("")))	wheresql+=" and  (oa_bgypbm.dj="+oa_bgypbm_dj+") ";
	}
	oa_bgypbm_pp=request.getParameter("oa_bgypbm_pp");
	if (oa_bgypbm_pp!=null)
	{
		oa_bgypbm_pp=cf.GB2Uni(oa_bgypbm_pp);
		if (!(oa_bgypbm_pp.equals("")))	wheresql+=" and  (oa_bgypbm.pp='"+oa_bgypbm_pp+"')";
	}
	oa_bgypbm_xh=request.getParameter("oa_bgypbm_xh");
	if (oa_bgypbm_xh!=null)
	{
		oa_bgypbm_xh=cf.GB2Uni(oa_bgypbm_xh);
		if (!(oa_bgypbm_xh.equals("")))	wheresql+=" and  (oa_bgypbm.xh='"+oa_bgypbm_xh+"')";
	}
	oa_bgypbm_ghs=request.getParameter("oa_bgypbm_ghs");
	if (oa_bgypbm_ghs!=null)
	{
		oa_bgypbm_ghs=cf.GB2Uni(oa_bgypbm_ghs);
		if (!(oa_bgypbm_ghs.equals("")))	wheresql+=" and  (oa_bgypbm.ghs='"+oa_bgypbm_ghs+"')";
	}
	ls_sql="SELECT dwmc,oa_bgypbm.bgypbm,oa_bgypbm.bgypmc,oa_flbm.flmc,oa_bgypbm.jldw,oa_bgypbm.dj,oa_bgypbm.pp,oa_bgypbm.xh,oa_bgypbm.ghs  ";
	ls_sql+=" FROM oa_flbm,oa_bgypbm,sq_dwxx  ";
    ls_sql+=" where oa_bgypbm.flbm=oa_flbm.flbm and oa_bgypbm.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by oa_bgypbm.fgsbh,oa_bgypbm.bgypbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Oa_bgypbmCxList.jsp","SelectCxOa_bgypbm.jsp","","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"bgypbm","oa_bgypbm_bgypmc","oa_flbm_flmc","oa_bgypbm_jldw","oa_bgypbm_dj","oa_bgypbm_pp","oa_bgypbm_xh","oa_bgypbm_ghs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bgypbm"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">������˾</td>
	<td  width="6%">����</td>
	<td  width="19%">�칫��Ʒ����</td>
	<td  width="8%">�칫��Ʒ����</td>
	<td  width="8%">������λ</td>
	<td  width="8%">����</td>
	<td  width="13%">Ʒ��</td>
	<td  width="11%">�ͺ�</td>
	<td  width="17%">������</td>
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