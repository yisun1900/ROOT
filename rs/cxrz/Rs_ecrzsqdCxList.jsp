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
	String rs_ecrzsqd_sqxh=null;
	String rs_ecrzsqd_fgsbh=null;
	String rs_ecrzsqd_ygbh=null;
	String rs_ecrzsqd_yhmc=null;
	String rs_ecrzsqd_xb=null;
	String rs_ecrzsqd_yfgsbh=null;
	String rs_ecrzsqd_ydwbh=null;
	String rs_ecrzsqd_yxzzwbm=null;
	String rs_ecrzsqd_yrzsj=null;
	String rs_ecrzsqd_ylzrq=null;
	String rs_ecrzsqd_xdwbh=null;
	String rs_ecrzsqd_xxzzwbm=null;
	String rs_ecrzsqd_lrr=null;
	String rs_ecrzsqd_lrsj=null;
	String rs_ecrzsqd_lrbm=null;
	String rs_ecrzsqd_clzt=null;
	String rs_ecrzsqd_ztbm=null;
	String rs_ecrzsqd_spxh=null;
	String rs_ecrzsqd_shr=null;
	String rs_ecrzsqd_shsj=null;
	String rs_ecrzsqd_shjl=null;

	String sqrq=null;
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_ecrzsqd.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_ecrzsqd.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	
	rs_ecrzsqd_sqxh=request.getParameter("rs_ecrzsqd_sqxh");
	if (rs_ecrzsqd_sqxh!=null)
	{
		rs_ecrzsqd_sqxh=cf.GB2Uni(rs_ecrzsqd_sqxh);
		if (!(rs_ecrzsqd_sqxh.equals("")))	wheresql+=" and  (rs_ecrzsqd.sqxh='"+rs_ecrzsqd_sqxh+"')";
	}
	rs_ecrzsqd_fgsbh=request.getParameter("rs_ecrzsqd_fgsbh");
	if (rs_ecrzsqd_fgsbh!=null)
	{
		rs_ecrzsqd_fgsbh=cf.GB2Uni(rs_ecrzsqd_fgsbh);
		if (!(rs_ecrzsqd_fgsbh.equals("")))	wheresql+=" and  (rs_ecrzsqd.fgsbh='"+rs_ecrzsqd_fgsbh+"')";
	}
	rs_ecrzsqd_ygbh=request.getParameter("rs_ecrzsqd_ygbh");
	if (rs_ecrzsqd_ygbh!=null)
	{
		rs_ecrzsqd_ygbh=rs_ecrzsqd_ygbh.trim();
		if (!(rs_ecrzsqd_ygbh.equals("")))	wheresql+=" and (rs_ecrzsqd.ygbh="+rs_ecrzsqd_ygbh+") ";
	}
	rs_ecrzsqd_yhmc=request.getParameter("rs_ecrzsqd_yhmc");
	if (rs_ecrzsqd_yhmc!=null)
	{
		rs_ecrzsqd_yhmc=cf.GB2Uni(rs_ecrzsqd_yhmc);
		if (!(rs_ecrzsqd_yhmc.equals("")))	wheresql+=" and  (rs_ecrzsqd.yhmc='"+rs_ecrzsqd_yhmc+"')";
	}
	rs_ecrzsqd_xb=request.getParameter("rs_ecrzsqd_xb");
	if (rs_ecrzsqd_xb!=null)
	{
		rs_ecrzsqd_xb=cf.GB2Uni(rs_ecrzsqd_xb);
		if (!(rs_ecrzsqd_xb.equals("")))	wheresql+=" and  (rs_ecrzsqd.xb='"+rs_ecrzsqd_xb+"')";
	}
	rs_ecrzsqd_yfgsbh=request.getParameter("rs_ecrzsqd_yfgsbh");
	if (rs_ecrzsqd_yfgsbh!=null)
	{
		rs_ecrzsqd_yfgsbh=cf.GB2Uni(rs_ecrzsqd_yfgsbh);
		if (!(rs_ecrzsqd_yfgsbh.equals("")))	wheresql+=" and  (rs_ecrzsqd.yfgsbh='"+rs_ecrzsqd_yfgsbh+"')";
	}
	rs_ecrzsqd_ydwbh=request.getParameter("rs_ecrzsqd_ydwbh");
	if (rs_ecrzsqd_ydwbh!=null)
	{
		rs_ecrzsqd_ydwbh=cf.GB2Uni(rs_ecrzsqd_ydwbh);
		if (!(rs_ecrzsqd_ydwbh.equals("")))	wheresql+=" and  (rs_ecrzsqd.ydwbh='"+rs_ecrzsqd_ydwbh+"')";
	}
	rs_ecrzsqd_yxzzwbm=request.getParameter("rs_ecrzsqd_yxzzwbm");
	if (rs_ecrzsqd_yxzzwbm!=null)
	{
		rs_ecrzsqd_yxzzwbm=cf.GB2Uni(rs_ecrzsqd_yxzzwbm);
		if (!(rs_ecrzsqd_yxzzwbm.equals("")))	wheresql+=" and  (rs_ecrzsqd.yxzzwbm='"+rs_ecrzsqd_yxzzwbm+"')";
	}
	rs_ecrzsqd_yrzsj=request.getParameter("rs_ecrzsqd_yrzsj");
	if (rs_ecrzsqd_yrzsj!=null)
	{
		rs_ecrzsqd_yrzsj=rs_ecrzsqd_yrzsj.trim();
		if (!(rs_ecrzsqd_yrzsj.equals("")))	wheresql+="  and (rs_ecrzsqd.yrzsj=TO_DATE('"+rs_ecrzsqd_yrzsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzsqd_ylzrq=request.getParameter("rs_ecrzsqd_ylzrq");
	if (rs_ecrzsqd_ylzrq!=null)
	{
		rs_ecrzsqd_ylzrq=rs_ecrzsqd_ylzrq.trim();
		if (!(rs_ecrzsqd_ylzrq.equals("")))	wheresql+="  and (rs_ecrzsqd.ylzrq=TO_DATE('"+rs_ecrzsqd_ylzrq+"','YYYY/MM/DD'))";
	}
	rs_ecrzsqd_xdwbh=request.getParameter("rs_ecrzsqd_xdwbh");
	if (rs_ecrzsqd_xdwbh!=null)
	{
		rs_ecrzsqd_xdwbh=cf.GB2Uni(rs_ecrzsqd_xdwbh);
		if (!(rs_ecrzsqd_xdwbh.equals("")))	wheresql+=" and  (rs_ecrzsqd.xdwbh='"+rs_ecrzsqd_xdwbh+"')";
	}
	rs_ecrzsqd_xxzzwbm=request.getParameter("rs_ecrzsqd_xxzzwbm");
	if (rs_ecrzsqd_xxzzwbm!=null)
	{
		rs_ecrzsqd_xxzzwbm=cf.GB2Uni(rs_ecrzsqd_xxzzwbm);
		if (!(rs_ecrzsqd_xxzzwbm.equals("")))	wheresql+=" and  (rs_ecrzsqd.xxzzwbm='"+rs_ecrzsqd_xxzzwbm+"')";
	}
	rs_ecrzsqd_lrr=request.getParameter("rs_ecrzsqd_lrr");
	if (rs_ecrzsqd_lrr!=null)
	{
		rs_ecrzsqd_lrr=cf.GB2Uni(rs_ecrzsqd_lrr);
		if (!(rs_ecrzsqd_lrr.equals("")))	wheresql+=" and  (rs_ecrzsqd.lrr='"+rs_ecrzsqd_lrr+"')";
	}
	rs_ecrzsqd_lrsj=request.getParameter("rs_ecrzsqd_lrsj");
	if (rs_ecrzsqd_lrsj!=null)
	{
		rs_ecrzsqd_lrsj=rs_ecrzsqd_lrsj.trim();
		if (!(rs_ecrzsqd_lrsj.equals("")))	wheresql+="  and (rs_ecrzsqd.lrsj>=TO_DATE('"+rs_ecrzsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzsqd_lrsj=request.getParameter("rs_ecrzsqd_lrsj2");
	if (rs_ecrzsqd_lrsj!=null)
	{
		rs_ecrzsqd_lrsj=rs_ecrzsqd_lrsj.trim();
		if (!(rs_ecrzsqd_lrsj.equals("")))	wheresql+="  and (rs_ecrzsqd.lrsj<=TO_DATE('"+rs_ecrzsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzsqd_lrbm=request.getParameter("rs_ecrzsqd_lrbm");
	if (rs_ecrzsqd_lrbm!=null)
	{
		rs_ecrzsqd_lrbm=cf.GB2Uni(rs_ecrzsqd_lrbm);
		if (!(rs_ecrzsqd_lrbm.equals("")))	wheresql+=" and  (rs_ecrzsqd.lrbm='"+rs_ecrzsqd_lrbm+"')";
	}
	rs_ecrzsqd_clzt=request.getParameter("rs_ecrzsqd_clzt");
	if (rs_ecrzsqd_clzt!=null)
	{
		rs_ecrzsqd_clzt=cf.GB2Uni(rs_ecrzsqd_clzt);
		if (!(rs_ecrzsqd_clzt.equals("")))	wheresql+=" and  (rs_ecrzsqd.clzt='"+rs_ecrzsqd_clzt+"')";
	}
	rs_ecrzsqd_ztbm=request.getParameter("rs_ecrzsqd_ztbm");
	if (rs_ecrzsqd_ztbm!=null)
	{
		rs_ecrzsqd_ztbm=cf.GB2Uni(rs_ecrzsqd_ztbm);
		if (!(rs_ecrzsqd_ztbm.equals("")))	wheresql+=" and  (rs_ecrzsqd.ztbm='"+rs_ecrzsqd_ztbm+"')";
	}
	rs_ecrzsqd_spxh=request.getParameter("rs_ecrzsqd_spxh");
	if (rs_ecrzsqd_spxh!=null)
	{
		rs_ecrzsqd_spxh=rs_ecrzsqd_spxh.trim();
		if (!(rs_ecrzsqd_spxh.equals("")))	wheresql+=" and (rs_ecrzsqd.spxh="+rs_ecrzsqd_spxh+") ";
	}
	rs_ecrzsqd_shr=request.getParameter("rs_ecrzsqd_shr");
	if (rs_ecrzsqd_shr!=null)
	{
		rs_ecrzsqd_shr=cf.GB2Uni(rs_ecrzsqd_shr);
		if (!(rs_ecrzsqd_shr.equals("")))	wheresql+=" and  (rs_ecrzsqd.shr='"+rs_ecrzsqd_shr+"')";
	}
	rs_ecrzsqd_shsj=request.getParameter("rs_ecrzsqd_shsj");
	if (rs_ecrzsqd_shsj!=null)
	{
		rs_ecrzsqd_shsj=rs_ecrzsqd_shsj.trim();
		if (!(rs_ecrzsqd_shsj.equals("")))	wheresql+="  and (rs_ecrzsqd.shsj>=TO_DATE('"+rs_ecrzsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzsqd_shsj=request.getParameter("rs_ecrzsqd_shsj2");
	if (rs_ecrzsqd_shsj!=null)
	{
		rs_ecrzsqd_shsj=rs_ecrzsqd_shsj.trim();
		if (!(rs_ecrzsqd_shsj.equals("")))	wheresql+="  and (rs_ecrzsqd.shsj<=TO_DATE('"+rs_ecrzsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzsqd_shjl=request.getParameter("rs_ecrzsqd_shjl");
	if (rs_ecrzsqd_shjl!=null)
	{
		rs_ecrzsqd_shjl=cf.GB2Uni(rs_ecrzsqd_shjl);
		if (!(rs_ecrzsqd_shjl.equals("")))	wheresql+=" and  (rs_ecrzsqd.shjl='"+rs_ecrzsqd_shjl+"')";
	}
	ls_sql="SELECT rs_ecrzsqd.sqxh,DECODE(rs_ecrzsqd.clzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��','05','����ְ'),ztmc,a.dwmc fgsbh,rs_ecrzsqd.yhmc, DECODE(rs_ecrzsqd.xb,'M','��','W','Ů'),b.dwmc yfgsbh,c.dwmc ydwbh,rs_ecrzsqd.yxzzwbm,rs_ecrzsqd.yrzsj,rs_ecrzsqd.ylzrq,rs_ecrzsqd.ylzyy,d.dwmc xdwbh,rs_ecrzsqd.xxzzwbm,rs_ecrzsqd.xrzyy,rs_ecrzsqd.sqrq,rs_ecrzsqd.lrr,rs_ecrzsqd.lrsj,rs_ecrzsqd.bz,rs_ecrzsqd.spxh,rs_ecrzsqd.shr,rs_ecrzsqd.shsj,shjlmc,rs_ecrzsqd.shyj";
	ls_sql+=" FROM rs_ecrzsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_ecrzsqd.fgsbh=a.dwbh(+) and rs_ecrzsqd.ztbm=rs_ztbm.ztbm(+)";
    ls_sql+=" and rs_ecrzsqd.yfgsbh=b.dwbh(+) and rs_ecrzsqd.ydwbh=c.dwbh(+) and rs_ecrzsqd.xdwbh=d.dwbh(+)";
    ls_sql+=" and rs_ecrzsqd.shjl=rs_shjlbm.shjl(+) and rs_ecrzsqd.clzt in('00','03')";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_ecrzsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ecrzsqdCxList.jsp","SelectCxRs_ecrzsqd.jsp","","CxrzSq_yhxx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_ecrzsqd_ygbh","rs_ecrzsqd_yhmc","rs_ecrzsqd_xb","rs_ecrzsqd_yfgsbh","rs_ecrzsqd_ydwbh","rs_ecrzsqd_yxzzwbm","rs_ecrzsqd_yrzsj","rs_ecrzsqd_ylzrq","rs_ecrzsqd_ylzyy","rs_ecrzsqd_xdwbh","rs_ecrzsqd_xxzzwbm","rs_ecrzsqd_xrzyy","rs_ecrzsqd_lrr","rs_ecrzsqd_lrsj","rs_ecrzsqd_lrbm","rs_ecrzsqd_bz","rs_ecrzsqd_clzt","rs_ecrzsqd_ztbm","rs_ecrzsqd_spxh","rs_ecrzsqd_shr","rs_ecrzsqd_shsj","rs_ecrzsqd_shjl","rs_ecrzsqd_shyj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//	pageObj.setEditBolt("");
	pageObj.setEditStr("��ְ");
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/ecrzsh/ViewRs_ecrzsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
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
  <B><font size="3">��ְԱ��������ְ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">����״̬</td>
	<td  width="4%">�걨��˾</td>
	<td  width="2%">Ա������</td>
	<td  width="2%">�Ա�</td>
	<td  width="4%">ԭ�ֹ�˾</td>
	<td  width="4%">ԭ����</td>
	<td  width="4%">ԭְλ</td>
	<td  width="3%">�ϴ���ְ����</td>
	<td  width="3%">��ְ����</td>
	<td  width="10%">��ְԭ��</td>
	<td  width="4%">���������ְ����</td>
	<td  width="4%">���������ְְλ</td>
	<td  width="10%">������ְԭ��</td>
	<td  width="3%">��������</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="6%">��ע</td>
	<td  width="2%">�������</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">��˽���</td>
	<td  width="9%">������</td>
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