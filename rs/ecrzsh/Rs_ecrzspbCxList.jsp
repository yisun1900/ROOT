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
	String rs_ecrzspb_spxh=null;
	String rs_ecrzspb_sqxh=null;
	String rs_ecrzsqd_fgsbh=null;
	String rs_ecrzsqd_ygbh=null;
	String rs_ecrzsqd_yhmc=null;
	String rs_ecrzsqd_xb=null;
	String rs_ecrzsqd_xdwbh=null;
	String rs_ecrzsqd_xxzzwbm=null;
	String rs_ecrzsqd_lrsj=null;
	String rs_ecrzspb_shjl=null;
	String rs_ecrzspb_shr=null;
	String rs_ecrzspb_shsj=null;
	String rs_ecrzspb_clzt=null;
	String rs_ecrzspb_ztbm=null;
	String rs_ecrzspb_yclzt=null;
	String rs_ecrzspb_yztbm=null;
	rs_ecrzspb_spxh=request.getParameter("rs_ecrzspb_spxh");
	if (rs_ecrzspb_spxh!=null)
	{
		rs_ecrzspb_spxh=rs_ecrzspb_spxh.trim();
		if (!(rs_ecrzspb_spxh.equals("")))	wheresql+=" and (rs_ecrzspb.spxh="+rs_ecrzspb_spxh+") ";
	}
	rs_ecrzspb_sqxh=request.getParameter("rs_ecrzspb_sqxh");
	if (rs_ecrzspb_sqxh!=null)
	{
		rs_ecrzspb_sqxh=cf.GB2Uni(rs_ecrzspb_sqxh);
		if (!(rs_ecrzspb_sqxh.equals("")))	wheresql+=" and  (rs_ecrzspb.sqxh='"+rs_ecrzspb_sqxh+"')";
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
	rs_ecrzspb_shjl=request.getParameter("rs_ecrzspb_shjl");
	if (rs_ecrzspb_shjl!=null)
	{
		rs_ecrzspb_shjl=cf.GB2Uni(rs_ecrzspb_shjl);
		if (!(rs_ecrzspb_shjl.equals("")))	wheresql+=" and  (rs_ecrzspb.shjl='"+rs_ecrzspb_shjl+"')";
	}
	rs_ecrzspb_shr=request.getParameter("rs_ecrzspb_shr");
	if (rs_ecrzspb_shr!=null)
	{
		rs_ecrzspb_shr=cf.GB2Uni(rs_ecrzspb_shr);
		if (!(rs_ecrzspb_shr.equals("")))	wheresql+=" and  (rs_ecrzspb.shr='"+rs_ecrzspb_shr+"')";
	}
	rs_ecrzspb_shsj=request.getParameter("rs_ecrzspb_shsj");
	if (rs_ecrzspb_shsj!=null)
	{
		rs_ecrzspb_shsj=rs_ecrzspb_shsj.trim();
		if (!(rs_ecrzspb_shsj.equals("")))	wheresql+="  and (rs_ecrzspb.shsj>=TO_DATE('"+rs_ecrzspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzspb_shsj=request.getParameter("rs_ecrzspb_shsj2");
	if (rs_ecrzspb_shsj!=null)
	{
		rs_ecrzspb_shsj=rs_ecrzspb_shsj.trim();
		if (!(rs_ecrzspb_shsj.equals("")))	wheresql+="  and (rs_ecrzspb.shsj<=TO_DATE('"+rs_ecrzspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzspb_clzt=request.getParameter("rs_ecrzspb_clzt");
	if (rs_ecrzspb_clzt!=null)
	{
		rs_ecrzspb_clzt=cf.GB2Uni(rs_ecrzspb_clzt);
		if (!(rs_ecrzspb_clzt.equals("")))	wheresql+=" and  (rs_ecrzspb.clzt='"+rs_ecrzspb_clzt+"')";
	}
	rs_ecrzspb_ztbm=request.getParameter("rs_ecrzspb_ztbm");
	if (rs_ecrzspb_ztbm!=null)
	{
		rs_ecrzspb_ztbm=cf.GB2Uni(rs_ecrzspb_ztbm);
		if (!(rs_ecrzspb_ztbm.equals("")))	wheresql+=" and  (rs_ecrzspb.ztbm='"+rs_ecrzspb_ztbm+"')";
	}
	rs_ecrzspb_yclzt=request.getParameter("rs_ecrzspb_yclzt");
	if (rs_ecrzspb_yclzt!=null)
	{
		rs_ecrzspb_yclzt=cf.GB2Uni(rs_ecrzspb_yclzt);
		if (!(rs_ecrzspb_yclzt.equals("")))	wheresql+=" and  (rs_ecrzspb.yclzt='"+rs_ecrzspb_yclzt+"')";
	}
	rs_ecrzspb_yztbm=request.getParameter("rs_ecrzspb_yztbm");
	if (rs_ecrzspb_yztbm!=null)
	{
		rs_ecrzspb_yztbm=cf.GB2Uni(rs_ecrzspb_yztbm);
		if (!(rs_ecrzspb_yztbm.equals("")))	wheresql+=" and  (rs_ecrzspb.yztbm='"+rs_ecrzspb_yztbm+"')";
	}
	ls_sql="SELECT rs_ecrzspb.spxh,rs_ecrzspb.sqxh,a.dwmc fgsbh,rs_ecrzsqd.ygbh,rs_ecrzsqd.yhmc, DECODE(rs_ecrzsqd.xb,'M','��','W','Ů'),b.dwmc xdwbh,rs_ecrzsqd.xxzzwbm,rs_ecrzsqd.lrsj,e.shjlmc shjl,rs_ecrzspb.shyj,rs_ecrzspb.shr,rs_ecrzspb.shsj, DECODE(rs_ecrzspb.clzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��','05','����ְ'),g.ztmc ztbm,rs_ecrzspb.yspxh, DECODE(rs_ecrzspb.yclzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��','05','����ְ'),h.ztmc yztbm,f.shjlmc yshjl,rs_ecrzspb.yshyj,rs_ecrzspb.yshr,rs_ecrzspb.yshsj  ";
	ls_sql+=" FROM rs_ecrzspb,rs_ecrzsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_ecrzspb.sqxh=rs_ecrzsqd.sqxh";
    ls_sql+=" and rs_ecrzsqd.fgsbh=a.dwbh(+) and rs_ecrzsqd.xdwbh=b.dwbh(+) and rs_ecrzsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_ecrzspb.shjl=e.shjl(+) and rs_ecrzspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_ecrzspb.ztbm=g.ztbm(+) and rs_ecrzspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_ecrzspb.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ecrzspbCxList.jsp","SelectCxRs_ecrzspb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_ecrzspb_sqxh","rs_ecrzsqd_fgsbh","rs_ecrzsqd_ygbh","rs_ecrzsqd_yhmc","rs_ecrzsqd_xb","rs_ecrzsqd_xdwbh","rs_ecrzsqd_xxzzwbm","rs_ecrzsqd_lrsj","rs_ecrzspb_shjl","rs_ecrzspb_shyj","rs_ecrzspb_shr","rs_ecrzspb_shsj","rs_ecrzspb_clzt","rs_ecrzspb_ztbm","rs_ecrzspb_yspxh","rs_ecrzspb_yclzt","rs_ecrzspb_yztbm","rs_ecrzspb_yshjl","rs_ecrzspb_yshyj","rs_ecrzspb_yshr","rs_ecrzspb_yshsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"spxh"};
	pageObj.setKey(keyName);
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
  <B><font size="3">������ְ������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�������</td>
	<td  width="4%">������ְ�������</td>
	<td  width="5%">�걨��˾</td>
	<td  width="3%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="2%">�Ա�</td>
	<td  width="5%">���������ְ����</td>
	<td  width="5%">���������ְְλ</td>
	<td  width="3%">����¼��ʱ��</td>
	<td  width="3%">��˽���</td>
	<td  width="12%">������</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">��˺���״̬</td>
	<td  width="6%">��˺�����״̬</td>
	<td  width="3%">�ϴ��������</td>
	<td  width="3%">�ϴδ���״̬</td>
	<td  width="6%">�ϴ�����״̬</td>
	<td  width="3%">�ϴ���˽���</td>
	<td  width="11%">�ϴ�������</td>
	<td  width="2%">�ϴ������</td>
	<td  width="3%">�ϴ����ʱ��</td>
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