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
	String xz_gdzcb_gsbh=null;
	String xz_gdzcb_gdzcmc=null;
	String xz_gdzcb_bmbh=null;
	String xz_gdzcb_gdzcflbm=null;
	String xz_gdzcb_xh=null;
	String xz_gdzcb_pp=null;
	String xz_gdzcb_grsj=null;
	String xz_gdzcb_bgr=null;
	String xz_gdzcb_dwbh=null;
	String xz_gdzcb_fgsbh=null;
	String xz_gdzcb_sfybf=null;
	String xz_gdzcb_lrr=null;
	String xz_gdzcb_lrsj=null;
	String yjsj=null;
	xz_gdzcb_gsbh=request.getParameter("xz_gdzcb_gsbh");
	if (xz_gdzcb_gsbh!=null)
	{
		xz_gdzcb_gsbh=cf.GB2Uni(xz_gdzcb_gsbh);
		if (!(xz_gdzcb_gsbh.equals("")))	wheresql+=" and  (xz_gdzcb.gsbh='"+xz_gdzcb_gsbh+"')";
	}
	xz_gdzcb_gdzcmc=request.getParameter("xz_gdzcb_gdzcmc");
	if (xz_gdzcb_gdzcmc!=null)
	{
		xz_gdzcb_gdzcmc=cf.GB2Uni(xz_gdzcb_gdzcmc);
		if (!(xz_gdzcb_gdzcmc.equals("")))	wheresql+=" and  (xz_gdzcb.gdzcmc like '%"+xz_gdzcb_gdzcmc+"%')";
	}
	xz_gdzcb_bmbh=request.getParameter("xz_gdzcb_bmbh");
	if (xz_gdzcb_bmbh!=null)
	{
		xz_gdzcb_bmbh=cf.GB2Uni(xz_gdzcb_bmbh);
		if (!(xz_gdzcb_bmbh.equals("")))	wheresql+=" and  (xz_gdzcb.bmbh='"+xz_gdzcb_bmbh+"')";
	}
	xz_gdzcb_gdzcflbm=request.getParameter("xz_gdzcb_gdzcflbm");
	if (xz_gdzcb_gdzcflbm!=null)
	{
		xz_gdzcb_gdzcflbm=cf.GB2Uni(xz_gdzcb_gdzcflbm);
		if (!(xz_gdzcb_gdzcflbm.equals("")))	wheresql+=" and  (xz_gdzcb.gdzcflbm='"+xz_gdzcb_gdzcflbm+"')";
	}
	xz_gdzcb_xh=request.getParameter("xz_gdzcb_xh");
	if (xz_gdzcb_xh!=null)
	{
		xz_gdzcb_xh=cf.GB2Uni(xz_gdzcb_xh);
		if (!(xz_gdzcb_xh.equals("")))	wheresql+=" and  (xz_gdzcb.xh like '%"+xz_gdzcb_xh+"%')";
	}
	xz_gdzcb_pp=request.getParameter("xz_gdzcb_pp");
	if (xz_gdzcb_pp!=null)
	{
		xz_gdzcb_pp=cf.GB2Uni(xz_gdzcb_pp);
		if (!(xz_gdzcb_pp.equals("")))	wheresql+=" and  (xz_gdzcb.pp like '%"+xz_gdzcb_pp+"%')";
	}
	xz_gdzcb_grsj=request.getParameter("xz_gdzcb_grsj");
	if (xz_gdzcb_grsj!=null)
	{
		xz_gdzcb_grsj=xz_gdzcb_grsj.trim();
		if (!(xz_gdzcb_grsj.equals("")))	wheresql+="  and (xz_gdzcb.grsj>=TO_DATE('"+xz_gdzcb_grsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcb_grsj=request.getParameter("xz_gdzcb_grsj2");
	if (xz_gdzcb_grsj!=null)
	{
		xz_gdzcb_grsj=xz_gdzcb_grsj.trim();
		if (!(xz_gdzcb_grsj.equals("")))	wheresql+="  and (xz_gdzcb.grsj<=TO_DATE('"+xz_gdzcb_grsj+"','YYYY/MM/DD'))";
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
	xz_gdzcb_sfybf=request.getParameter("xz_gdzcb_sfybf");
	if (xz_gdzcb_sfybf!=null)
	{
		xz_gdzcb_sfybf=cf.GB2Uni(xz_gdzcb_sfybf);
		if (!(xz_gdzcb_sfybf.equals("")))	wheresql+=" and  (xz_gdzcb.sfybf='"+xz_gdzcb_sfybf+"')";
	}
	xz_gdzcb_lrr=request.getParameter("xz_gdzcb_lrr");
	if (xz_gdzcb_lrr!=null)
	{
		xz_gdzcb_lrr=cf.GB2Uni(xz_gdzcb_lrr);
		if (!(xz_gdzcb_lrr.equals("")))	wheresql+=" and  (xz_gdzcb.lrr='"+xz_gdzcb_lrr+"')";
	}
	xz_gdzcb_lrsj=request.getParameter("xz_gdzcb_lrsj");
	if (xz_gdzcb_lrsj!=null)
	{
		xz_gdzcb_lrsj=xz_gdzcb_lrsj.trim();
		if (!(xz_gdzcb_lrsj.equals("")))	wheresql+="  and (xz_gdzcb.lrsj=TO_DATE('"+xz_gdzcb_lrsj+"','YYYY/MM/DD'))";
	}
	yjsj=request.getParameter("yjsj");
	if (yjsj!=null)
	{
		yjsj=yjsj.trim();
		if (!(yjsj.equals("")))	wheresql+="  and (xz_gdzcb.yjsj>=TO_DATE('"+yjsj+"','YYYY/MM/DD'))";
	}
	yjsj=request.getParameter("yjsj2");
	if (yjsj!=null)
	{
		yjsj=yjsj.trim();
		if (!(yjsj.equals("")))	wheresql+="  and (xz_gdzcb.yjsj<=TO_DATE('"+yjsj+"','YYYY/MM/DD'))";
	}


	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}


	ls_sql="SELECT xz_gdzcb.gsbh,xz_gdzcb.gdzcmc,xz_gdzcb.bmbh,xz_gdzcflbm.gdzcflmc,xz_gdzcb.xh,xz_gdzcb.pp,xz_gdzcb.sl,xz_gdzcb.grsj,xz_gdzcb.grj,xz_gdzcb.gzd,xz_gdzcb.yjsj,xz_gdzcb.bgr,sq_dwxx.dwmc, DECODE(xz_gdzcb.sfybf,'Y','��','N','��'),xz_gdzcb.lrr,xz_gdzcb.lrsj,xz_gdzcb.bz  ";
	ls_sql+=" FROM sq_dwxx,xz_gdzcflbm,xz_gdzcb  ";
    ls_sql+=" where xz_gdzcb.dwbh=sq_dwxx.dwbh and xz_gdzcb.gdzcflbm=xz_gdzcflbm.gdzcflbm";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_gdzcbCxList.jsp","SelectCxXz_gdzcb.jsp","","InsertXz_dnsbbxsq.jsp");
	pageObj.setPageRow(30);
/*
//������ʾ��
	String[] disColName={"gsbh","xz_gdzcb_gdzcmc","xz_gdzcb_bmbh","xz_gdzcflbm_gdzcflmc","xz_gdzcb_xh","xz_gdzcb_pp","xz_gdzcb_sl","xz_gdzcb_grsj","xz_gdzcb_grj","xz_gdzcb_gzd","xz_gdzcb_bgr","sq_dwxx_dwmc","xz_gdzcb_sfybf","xz_gdzcb_lrr","xz_gdzcb_lrsj","xz_gdzcb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gsbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("����");
	pageObj.setEditBolt("");
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
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("gdzcflmc","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">��д����������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">�̶��ʲ����</td>
	<td  width="9%">�̶��ʲ�����</td>
	<td  width="5%">�����ڲ����</td>
	<td  width="6%">�̶��ʲ�����</td>
	<td  width="6%">�ͺ�</td>
	<td  width="6%">Ʒ��</td>
	<td  width="4%">����</td>
	<td  width="5%">����ʱ��</td>
	<td  width="5%">�����</td>
	<td  width="8%">���õ�</td>
	<td  width="5%">�ƽ�ʱ��</td>
	<td  width="3%">������</td>
	<td  width="8%">��ǰ���ܲ���</td>
	<td  width="3%">�Ƿ��ѱ���</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="11%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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