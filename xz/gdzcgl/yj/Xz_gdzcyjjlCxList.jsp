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
	String xz_gdzcyjjl_gsbh=null;
	String xz_gdzcb_bgr=null;
	String xz_gdzcb_dwbh=null;
	String xz_gdzcb_fgsbh=null;
	String xz_gdzcyjjl_gdzcmc=null;
	String xz_gdzcyjjl_yjr=null;
	String xz_gdzcyjjl_yjsj=null;
	String xz_gdzcyjjl_jsr=null;
	String xz_gdzcyjjl_lrr=null;
	String xz_gdzcyjjl_lrsj=null;
	String xz_gdzcyjjl_lrbm=null;
	xz_gdzcyjjl_gsbh=request.getParameter("xz_gdzcyjjl_gsbh");
	if (xz_gdzcyjjl_gsbh!=null)
	{
		xz_gdzcyjjl_gsbh=cf.GB2Uni(xz_gdzcyjjl_gsbh);
		if (!(xz_gdzcyjjl_gsbh.equals("")))	wheresql+=" and  (xz_gdzcyjjl.gsbh='"+xz_gdzcyjjl_gsbh+"')";
	}
	xz_gdzcb_bgr=request.getParameter("xz_gdzcb_bgr");
	if (xz_gdzcb_bgr!=null)
	{
		xz_gdzcb_bgr=cf.GB2Uni(xz_gdzcb_bgr);
		if (!(xz_gdzcb_bgr.equals("")))	wheresql+=" and  (xz_gdzcb.bgr like '%"+xz_gdzcb_bgr+"%')";
	}
	xz_gdzcb_dwbh=request.getParameter("xz_gdzcb_dwbh");
	if (xz_gdzcb_dwbh!=null)
	{
		xz_gdzcb_dwbh=cf.GB2Uni(xz_gdzcb_dwbh);
		if (!(xz_gdzcb_dwbh.equals("")))	wheresql+=" and  (xz_gdzcb.dwbh='"+xz_gdzcb_dwbh+"')";
	}
	xz_gdzcb_fgsbh=request.getParameter("xz_gdzcb_fgsbh");
	if (xz_gdzcb_fgsbh!=null)
	{
		xz_gdzcb_fgsbh=cf.GB2Uni(xz_gdzcb_fgsbh);
		if (!(xz_gdzcb_fgsbh.equals("")))	wheresql+=" and  (xz_gdzcb.fgsbh='"+xz_gdzcb_fgsbh+"')";
	}
	xz_gdzcyjjl_gdzcmc=request.getParameter("xz_gdzcyjjl_gdzcmc");
	if (xz_gdzcyjjl_gdzcmc!=null)
	{
		xz_gdzcyjjl_gdzcmc=cf.GB2Uni(xz_gdzcyjjl_gdzcmc);
		if (!(xz_gdzcyjjl_gdzcmc.equals("")))	wheresql+=" and  (xz_gdzcyjjl.gdzcmc like '%"+xz_gdzcyjjl_gdzcmc+"%')";
	}
	xz_gdzcyjjl_yjr=request.getParameter("xz_gdzcyjjl_yjr");
	if (xz_gdzcyjjl_yjr!=null)
	{
		xz_gdzcyjjl_yjr=cf.GB2Uni(xz_gdzcyjjl_yjr);
		if (!(xz_gdzcyjjl_yjr.equals("")))	wheresql+=" and  (xz_gdzcyjjl.yjr like '%"+xz_gdzcyjjl_yjr+"%')";
	}
	xz_gdzcyjjl_yjsj=request.getParameter("xz_gdzcyjjl_yjsj");
	if (xz_gdzcyjjl_yjsj!=null)
	{
		xz_gdzcyjjl_yjsj=xz_gdzcyjjl_yjsj.trim();
		if (!(xz_gdzcyjjl_yjsj.equals("")))	wheresql+="  and (xz_gdzcyjjl.yjsj>=TO_DATE('"+xz_gdzcyjjl_yjsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcyjjl_yjsj=request.getParameter("xz_gdzcyjjl_yjsj2");
	if (xz_gdzcyjjl_yjsj!=null)
	{
		xz_gdzcyjjl_yjsj=xz_gdzcyjjl_yjsj.trim();
		if (!(xz_gdzcyjjl_yjsj.equals("")))	wheresql+="  and (xz_gdzcyjjl.yjsj<=TO_DATE('"+xz_gdzcyjjl_yjsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcyjjl_jsr=request.getParameter("xz_gdzcyjjl_jsr");
	if (xz_gdzcyjjl_jsr!=null)
	{
		xz_gdzcyjjl_jsr=cf.GB2Uni(xz_gdzcyjjl_jsr);
		if (!(xz_gdzcyjjl_jsr.equals("")))	wheresql+=" and  (xz_gdzcyjjl.jsr like '%"+xz_gdzcyjjl_jsr+"%')";
	}
	xz_gdzcyjjl_lrr=request.getParameter("xz_gdzcyjjl_lrr");
	if (xz_gdzcyjjl_lrr!=null)
	{
		xz_gdzcyjjl_lrr=cf.GB2Uni(xz_gdzcyjjl_lrr);
		if (!(xz_gdzcyjjl_lrr.equals("")))	wheresql+=" and  (xz_gdzcyjjl.lrr='"+xz_gdzcyjjl_lrr+"')";
	}
	xz_gdzcyjjl_lrsj=request.getParameter("xz_gdzcyjjl_lrsj");
	if (xz_gdzcyjjl_lrsj!=null)
	{
		xz_gdzcyjjl_lrsj=xz_gdzcyjjl_lrsj.trim();
		if (!(xz_gdzcyjjl_lrsj.equals("")))	wheresql+="  and (xz_gdzcyjjl.lrsj>=TO_DATE('"+xz_gdzcyjjl_lrsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcyjjl_lrsj=request.getParameter("xz_gdzcyjjl_lrsj2");
	if (xz_gdzcyjjl_lrsj!=null)
	{
		xz_gdzcyjjl_lrsj=xz_gdzcyjjl_lrsj.trim();
		if (!(xz_gdzcyjjl_lrsj.equals("")))	wheresql+="  and (xz_gdzcyjjl.lrsj<=TO_DATE('"+xz_gdzcyjjl_lrsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcyjjl_lrbm=request.getParameter("xz_gdzcyjjl_lrbm");
	if (xz_gdzcyjjl_lrbm!=null)
	{
		xz_gdzcyjjl_lrbm=cf.GB2Uni(xz_gdzcyjjl_lrbm);
		if (!(xz_gdzcyjjl_lrbm.equals("")))	wheresql+=" and  (xz_gdzcyjjl.lrbm='"+xz_gdzcyjjl_lrbm+"')";
	}

	ls_sql="SELECT xz_gdzcyjjl.gsbh,xz_gdzcb.bgr,b.dwmc mqdw,xz_gdzcyjjl.gdzcmc,xz_gdzcyjjl.yjr,xz_gdzcyjjl.yjsj,xz_gdzcyjjl.jsr,xz_gdzcyjjl.lrr,xz_gdzcyjjl.lrsj,a.dwmc lrbm,xz_gdzcyjjl.bz  ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b,xz_gdzcb,xz_gdzcyjjl  ";
    ls_sql+=" where xz_gdzcyjjl.lrbm=a.dwbh and xz_gdzcb.dwbh=b.dwbh and xz_gdzcyjjl.gsbh=xz_gdzcb.gsbh";
    ls_sql+=wheresql;
    ls_sql+=" order by xz_gdzcyjjl.gsbh,xz_gdzcyjjl.yjsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_gdzcyjjlCxList.jsp","SelectCxXz_gdzcyjjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gsbh","xz_gdzcb_bgr","xz_gdzcb_dwbh","xz_gdzcyjjl_gdzcmc","xz_gdzcyjjl_yjr","xz_gdzcyjjl_yjsj","xz_gdzcyjjl_jsr","xz_gdzcyjjl_lrr","xz_gdzcyjjl_lrsj","sq_dwxx_dwmc","xz_gdzcyjjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gsbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gsbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/xz/gdzcgl/ViewXz_gdzcb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gsbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�̶��ʲ����</td>
	<td  width="6%">Ŀǰ������</td>
	<td  width="11%">Ŀǰ���ܵ�λ</td>
	<td  width="12%">�̶��ʲ�����</td>
	<td  width="6%">�ƽ���</td>
	<td  width="7%">�ƽ�ʱ��</td>
	<td  width="6%">������</td>
	<td  width="6%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="11%">¼�벿��</td>
	<td  width="20%">��ע</td>
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