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
	String rs_bdsh_spxh=null;
	String rs_bdsh_bdxh=null;
	String rs_ygbdsqb_fgsbh=null;
	String rs_ygbdsqb_ygbh=null;
	String rs_ygbdsqb_yhmc=null;
	String rs_ygbdsqb_xb=null;
	String rs_ygbdsqb_lrsj=null;
	String rs_bdsh_shjl=null;
	String rs_bdsh_shr=null;
	String rs_bdsh_shsj=null;
	String rs_bdsh_clzt=null;
	String rs_bdsh_ztbm=null;
	String rs_bdsh_yclzt=null;
	String rs_bdsh_yztbm=null;
	rs_bdsh_spxh=request.getParameter("rs_bdsh_spxh");
	if (rs_bdsh_spxh!=null)
	{
		rs_bdsh_spxh=rs_bdsh_spxh.trim();
		if (!(rs_bdsh_spxh.equals("")))	wheresql+=" and (rs_bdsh.spxh="+rs_bdsh_spxh+") ";
	}
	rs_bdsh_bdxh=request.getParameter("rs_bdsh_bdxh");
	if (rs_bdsh_bdxh!=null)
	{
		rs_bdsh_bdxh=cf.GB2Uni(rs_bdsh_bdxh);
		if (!(rs_bdsh_bdxh.equals("")))	wheresql+=" and  (rs_bdsh.bdxh='"+rs_bdsh_bdxh+"')";
	}
	rs_ygbdsqb_fgsbh=request.getParameter("rs_ygbdsqb_fgsbh");
	if (rs_ygbdsqb_fgsbh!=null)
	{
		rs_ygbdsqb_fgsbh=cf.GB2Uni(rs_ygbdsqb_fgsbh);
		if (!(rs_ygbdsqb_fgsbh.equals("")))	wheresql+=" and  (rs_ygbdsqb.fgsbh='"+rs_ygbdsqb_fgsbh+"')";
	}
	rs_ygbdsqb_ygbh=request.getParameter("rs_ygbdsqb_ygbh");
	if (rs_ygbdsqb_ygbh!=null)
	{
		rs_ygbdsqb_ygbh=rs_ygbdsqb_ygbh.trim();
		if (!(rs_ygbdsqb_ygbh.equals("")))	wheresql+=" and (rs_ygbdsqb.ygbh="+rs_ygbdsqb_ygbh+") ";
	}
	rs_ygbdsqb_yhmc=request.getParameter("rs_ygbdsqb_yhmc");
	if (rs_ygbdsqb_yhmc!=null)
	{
		rs_ygbdsqb_yhmc=cf.GB2Uni(rs_ygbdsqb_yhmc);
		if (!(rs_ygbdsqb_yhmc.equals("")))	wheresql+=" and  (rs_ygbdsqb.yhmc='"+rs_ygbdsqb_yhmc+"')";
	}
	rs_ygbdsqb_xb=request.getParameter("rs_ygbdsqb_xb");
	if (rs_ygbdsqb_xb!=null)
	{
		rs_ygbdsqb_xb=cf.GB2Uni(rs_ygbdsqb_xb);
		if (!(rs_ygbdsqb_xb.equals("")))	wheresql+=" and  (rs_ygbdsqb.xb='"+rs_ygbdsqb_xb+"')";
	}
	rs_ygbdsqb_lrsj=request.getParameter("rs_ygbdsqb_lrsj");
	if (rs_ygbdsqb_lrsj!=null)
	{
		rs_ygbdsqb_lrsj=rs_ygbdsqb_lrsj.trim();
		if (!(rs_ygbdsqb_lrsj.equals("")))	wheresql+="  and (rs_ygbdsqb.lrsj>=TO_DATE('"+rs_ygbdsqb_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ygbdsqb_lrsj=request.getParameter("rs_ygbdsqb_lrsj2");
	if (rs_ygbdsqb_lrsj!=null)
	{
		rs_ygbdsqb_lrsj=rs_ygbdsqb_lrsj.trim();
		if (!(rs_ygbdsqb_lrsj.equals("")))	wheresql+="  and (rs_ygbdsqb.lrsj<=TO_DATE('"+rs_ygbdsqb_lrsj+"','YYYY/MM/DD'))";
	}
	rs_bdsh_shjl=request.getParameter("rs_bdsh_shjl");
	if (rs_bdsh_shjl!=null)
	{
		rs_bdsh_shjl=cf.GB2Uni(rs_bdsh_shjl);
		if (!(rs_bdsh_shjl.equals("")))	wheresql+=" and  (rs_bdsh.shjl='"+rs_bdsh_shjl+"')";
	}
	rs_bdsh_shr=request.getParameter("rs_bdsh_shr");
	if (rs_bdsh_shr!=null)
	{
		rs_bdsh_shr=cf.GB2Uni(rs_bdsh_shr);
		if (!(rs_bdsh_shr.equals("")))	wheresql+=" and  (rs_bdsh.shr='"+rs_bdsh_shr+"')";
	}
	rs_bdsh_shsj=request.getParameter("rs_bdsh_shsj");
	if (rs_bdsh_shsj!=null)
	{
		rs_bdsh_shsj=rs_bdsh_shsj.trim();
		if (!(rs_bdsh_shsj.equals("")))	wheresql+="  and (rs_bdsh.shsj>=TO_DATE('"+rs_bdsh_shsj+"','YYYY/MM/DD'))";
	}
	rs_bdsh_shsj=request.getParameter("rs_bdsh_shsj2");
	if (rs_bdsh_shsj!=null)
	{
		rs_bdsh_shsj=rs_bdsh_shsj.trim();
		if (!(rs_bdsh_shsj.equals("")))	wheresql+="  and (rs_bdsh.shsj<=TO_DATE('"+rs_bdsh_shsj+"','YYYY/MM/DD'))";
	}
	rs_bdsh_clzt=request.getParameter("rs_bdsh_clzt");
	if (rs_bdsh_clzt!=null)
	{
		rs_bdsh_clzt=cf.GB2Uni(rs_bdsh_clzt);
		if (!(rs_bdsh_clzt.equals("")))	wheresql+=" and  (rs_bdsh.clzt='"+rs_bdsh_clzt+"')";
	}
	rs_bdsh_ztbm=request.getParameter("rs_bdsh_ztbm");
	if (rs_bdsh_ztbm!=null)
	{
		rs_bdsh_ztbm=cf.GB2Uni(rs_bdsh_ztbm);
		if (!(rs_bdsh_ztbm.equals("")))	wheresql+=" and  (rs_bdsh.ztbm='"+rs_bdsh_ztbm+"')";
	}
	rs_bdsh_yclzt=request.getParameter("rs_bdsh_yclzt");
	if (rs_bdsh_yclzt!=null)
	{
		rs_bdsh_yclzt=cf.GB2Uni(rs_bdsh_yclzt);
		if (!(rs_bdsh_yclzt.equals("")))	wheresql+=" and  (rs_bdsh.yclzt='"+rs_bdsh_yclzt+"')";
	}
	rs_bdsh_yztbm=request.getParameter("rs_bdsh_yztbm");
	if (rs_bdsh_yztbm!=null)
	{
		rs_bdsh_yztbm=cf.GB2Uni(rs_bdsh_yztbm);
		if (!(rs_bdsh_yztbm.equals("")))	wheresql+=" and  (rs_bdsh.yztbm='"+rs_bdsh_yztbm+"')";
	}
	ls_sql="SELECT rs_bdsh.spxh,rs_bdsh.bdxh,DECODE(rs_ygbdsqb.bdxz,'01','ת��','02','��н','03','��ְ','04','��ְ','05','��ְ','06','����','07','����','08','����','99','����'),a.dwmc fgsbh,rs_ygbdsqb.ygbh,sq_yhxx.yhmc,sq_yhxx.xzzwbm,rs_ygbdsqb.lrsj,e.shjlmc shjl,rs_bdsh.shyj,rs_bdsh.shr,rs_bdsh.shsj, DECODE(rs_bdsh.clzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),g.ztmc ztbm,rs_bdsh.yspxh, DECODE(rs_bdsh.yclzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),h.ztmc yztbm,f.shjlmc yshjl,rs_bdsh.yshyj,rs_bdsh.yshr,rs_bdsh.yshsj  ";
	ls_sql+=" FROM rs_bdsh,rs_ygbdsqb,sq_yhxx,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_bdsh.bdxh=rs_ygbdsqb.bdxh";
    ls_sql+=" and rs_ygbdsqb.fgsbh=a.dwbh(+) and rs_ygbdsqb.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_bdsh.shjl=e.shjl(+) and rs_bdsh.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_bdsh.ztbm=g.ztbm(+) and rs_bdsh.yztbm=h.ztbm(+) ";
    ls_sql+=" and rs_ygbdsqb.ygbh=sq_yhxx.ygbh";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_bdsh.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_bdshCxList.jsp","SelectCxRs_bdsh.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_bdsh_bdxh","rs_ygbdsqb_fgsbh","rs_ygbdsqb_ygbh","rs_ygbdsqb_yhmc","rs_ygbdsqb_xb","rs_ygbdsqb_xdwbh","rs_ygbdsqb_xxzzwbm","rs_ygbdsqb_lrsj","rs_bdsh_shjl","rs_bdsh_shyj","rs_bdsh_shr","rs_bdsh_shsj","rs_bdsh_clzt","rs_bdsh_ztbm","rs_bdsh_yspxh","rs_bdsh_yclzt","rs_bdsh_yztbm","rs_bdsh_yshjl","rs_bdsh_yshyj","rs_bdsh_yshr","rs_bdsh_yshsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"spxh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ygbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"bdxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/rs/ygydsp/ViewRs_ygbdsqb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("bdxh",coluParm);//�в����������Hash��
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
  <B><font size="3">���±䶯--������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="4%">���±䶯���</td>
	<td  width="3%">�䶯����</td>
	<td  width="4%">�걨��˾</td>
	<td  width="3%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="4%">����ְ��</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="3%">��˽���</td>
	<td  width="17%">������</td>
	<td  width="2%">�����</td>
	<td  width="4%">���ʱ��</td>
	<td  width="3%">��˺���״̬</td>
	<td  width="6%">��˺�����״̬</td>
	<td  width="3%">�ϴ��������</td>
	<td  width="3%">�ϴδ���״̬</td>
	<td  width="6%">�ϴ�����״̬</td>
	<td  width="3%">�ϴ���˽���</td>
	<td  width="17%">�ϴ�������</td>
	<td  width="2%">�ϴ������</td>
	<td  width="4%">�ϴ����ʱ��</td>
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