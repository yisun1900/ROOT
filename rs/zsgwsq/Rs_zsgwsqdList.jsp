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
	String rs_zsgwsqd_fgsbh=null;
	String rs_zsgwsqd_dwbh=null;

	String zsgwmc=null;
	String slrq=null;

	String rs_zsgwsqd_sqxh=null;
	String rs_zsgwsqd_lrr=null;
	String rs_zsgwsqd_lrsj=null;
	String rs_zsgwsqd_lrbm=null;
	String sqrq=null;

	String rs_zsgwsqd_clzt=null;
	String rs_zsgwsqd_ztbm=null;
	String rs_zsgwsqd_spxh=null;
	String rs_zsgwsqd_shjl=null;
	String rs_zsgwsqd_shsj=null;
	String rs_zsgwsqd_shr=null;

	rs_zsgwsqd_fgsbh=request.getParameter("rs_zsgwsqd_fgsbh");
	if (rs_zsgwsqd_fgsbh!=null)
	{
		rs_zsgwsqd_fgsbh=cf.GB2Uni(rs_zsgwsqd_fgsbh);
		if (!(rs_zsgwsqd_fgsbh.equals("")))	wheresql+=" and  (rs_zsgwsqd.fgsbh='"+rs_zsgwsqd_fgsbh+"')";
	}
	rs_zsgwsqd_dwbh=request.getParameter("rs_zsgwsqd_dwbh");
	if (rs_zsgwsqd_dwbh!=null)
	{
		rs_zsgwsqd_dwbh=cf.GB2Uni(rs_zsgwsqd_dwbh);
		if (!(rs_zsgwsqd_dwbh.equals("")))	wheresql+=" and  (rs_zsgwsqd.dwbh='"+rs_zsgwsqd_dwbh+"')";
	}
	zsgwmc=request.getParameter("zsgwmc");
	if (zsgwmc!=null)
	{
		zsgwmc=cf.GB2Uni(zsgwmc);
		if (!(zsgwmc.equals("")))	wheresql+=" and  (rs_zsgwsqd.zsgwmc='"+zsgwmc+"')";
	}
	slrq=request.getParameter("slrq");
	if (slrq!=null)
	{
		slrq=slrq.trim();
		if (!(slrq.equals("")))	wheresql+="  and (rs_zsgwsqd.slrq>=TO_DATE('"+slrq+"','YYYY/MM/DD'))";
	}
	slrq=request.getParameter("slrq2");
	if (slrq!=null)
	{
		slrq=slrq.trim();
		if (!(slrq.equals("")))	wheresql+="  and (rs_zsgwsqd.slrq<=TO_DATE('"+slrq+"','YYYY/MM/DD'))";
	}

	
	rs_zsgwsqd_sqxh=request.getParameter("rs_zsgwsqd_sqxh");
	if (rs_zsgwsqd_sqxh!=null)
	{
		rs_zsgwsqd_sqxh=cf.GB2Uni(rs_zsgwsqd_sqxh);
		if (!(rs_zsgwsqd_sqxh.equals("")))	wheresql+=" and  (rs_zsgwsqd.sqxh='"+rs_zsgwsqd_sqxh+"')";
	}
	rs_zsgwsqd_lrr=request.getParameter("rs_zsgwsqd_lrr");
	if (rs_zsgwsqd_lrr!=null)
	{
		rs_zsgwsqd_lrr=cf.GB2Uni(rs_zsgwsqd_lrr);
		if (!(rs_zsgwsqd_lrr.equals("")))	wheresql+=" and  (rs_zsgwsqd.lrr='"+rs_zsgwsqd_lrr+"')";
	}
	rs_zsgwsqd_lrsj=request.getParameter("rs_zsgwsqd_lrsj");
	if (rs_zsgwsqd_lrsj!=null)
	{
		rs_zsgwsqd_lrsj=rs_zsgwsqd_lrsj.trim();
		if (!(rs_zsgwsqd_lrsj.equals("")))	wheresql+="  and (rs_zsgwsqd.lrsj>=TO_DATE('"+rs_zsgwsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_zsgwsqd_lrsj=request.getParameter("rs_zsgwsqd_lrsj2");
	if (rs_zsgwsqd_lrsj!=null)
	{
		rs_zsgwsqd_lrsj=rs_zsgwsqd_lrsj.trim();
		if (!(rs_zsgwsqd_lrsj.equals("")))	wheresql+="  and (rs_zsgwsqd.lrsj<=TO_DATE('"+rs_zsgwsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_zsgwsqd_lrbm=request.getParameter("rs_zsgwsqd_lrbm");
	if (rs_zsgwsqd_lrbm!=null)
	{
		rs_zsgwsqd_lrbm=cf.GB2Uni(rs_zsgwsqd_lrbm);
		if (!(rs_zsgwsqd_lrbm.equals("")))	wheresql+=" and  (rs_zsgwsqd.lrbm='"+rs_zsgwsqd_lrbm+"')";
	}
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_zsgwsqd.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_zsgwsqd.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	


	rs_zsgwsqd_clzt=request.getParameter("rs_zsgwsqd_clzt");
	if (rs_zsgwsqd_clzt!=null)
	{
		rs_zsgwsqd_clzt=cf.GB2Uni(rs_zsgwsqd_clzt);
		if (!(rs_zsgwsqd_clzt.equals("")))	wheresql+=" and  (rs_zsgwsqd.clzt='"+rs_zsgwsqd_clzt+"')";
	}
	rs_zsgwsqd_ztbm=request.getParameter("rs_zsgwsqd_ztbm");
	if (rs_zsgwsqd_ztbm!=null)
	{
		rs_zsgwsqd_ztbm=cf.GB2Uni(rs_zsgwsqd_ztbm);
		if (!(rs_zsgwsqd_ztbm.equals("")))	wheresql+=" and  (rs_zsgwsqd.ztbm='"+rs_zsgwsqd_ztbm+"')";
	}
	rs_zsgwsqd_spxh=request.getParameter("rs_zsgwsqd_spxh");
	if (rs_zsgwsqd_spxh!=null)
	{
		rs_zsgwsqd_spxh=rs_zsgwsqd_spxh.trim();
		if (!(rs_zsgwsqd_spxh.equals("")))	wheresql+=" and (rs_zsgwsqd.spxh="+rs_zsgwsqd_spxh+") ";
	}
	rs_zsgwsqd_shr=request.getParameter("rs_zsgwsqd_shr");
	if (rs_zsgwsqd_shr!=null)
	{
		rs_zsgwsqd_shr=cf.GB2Uni(rs_zsgwsqd_shr);
		if (!(rs_zsgwsqd_shr.equals("")))	wheresql+=" and  (rs_zsgwsqd.shr='"+rs_zsgwsqd_shr+"')";
	}
	rs_zsgwsqd_shsj=request.getParameter("rs_zsgwsqd_shsj");
	if (rs_zsgwsqd_shsj!=null)
	{
		rs_zsgwsqd_shsj=rs_zsgwsqd_shsj.trim();
		if (!(rs_zsgwsqd_shsj.equals("")))	wheresql+="  and (rs_zsgwsqd.shsj>=TO_DATE('"+rs_zsgwsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_zsgwsqd_shsj=request.getParameter("rs_zsgwsqd_shsj2");
	if (rs_zsgwsqd_shsj!=null)
	{
		rs_zsgwsqd_shsj=rs_zsgwsqd_shsj.trim();
		if (!(rs_zsgwsqd_shsj.equals("")))	wheresql+="  and (rs_zsgwsqd.shsj<=TO_DATE('"+rs_zsgwsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_zsgwsqd_shjl=request.getParameter("rs_zsgwsqd_shjl");
	if (rs_zsgwsqd_shjl!=null)
	{
		rs_zsgwsqd_shjl=cf.GB2Uni(rs_zsgwsqd_shjl);
		if (!(rs_zsgwsqd_shjl.equals("")))	wheresql+=" and  (rs_zsgwsqd.shjl='"+rs_zsgwsqd_shjl+"')";
	}

	ls_sql="SELECT rs_zsgwsqd.sqxh,DECODE(rs_zsgwsqd.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),ztmc,a.dwmc fgsbh,b.dwmc dwbh,rs_zsgwsqd.zsgwmc,rs_zsgwsqd.zbrs,rs_zsgwsqd.slrq,rs_zsgwsqd.sqzbly,rs_zsgwsqd.bmryjg,rs_zsgwsqd.zbgwzn,rs_zsgwsqd.zbgwxcfw,rs_zsgwsqd.sqrq,rs_zsgwsqd.lrr,rs_zsgwsqd.lrsj,c.dwmc lrbm,rs_zsgwsqd.bz,rs_zsgwsqd.spxh,rs_zsgwsqd.shr,rs_zsgwsqd.shsj,shjlmc,rs_zsgwsqd.shyj";
	ls_sql+=" FROM rs_zsgwsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_zsgwsqd.fgsbh=a.dwbh(+) and rs_zsgwsqd.dwbh=b.dwbh(+) and rs_zsgwsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_zsgwsqd.shjl=rs_shjlbm.shjl(+) and rs_zsgwsqd.ztbm=rs_ztbm.ztbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_zsgwsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_zsgwsqdList.jsp","SelectRs_zsgwsqd.jsp","","EditRs_zsgwsqd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_zsgwsqd_ygbh","rs_zsgwsqd_yhmc","rs_zsgwsqd_xb","rs_zsgwsqd_yfgsbh","rs_zsgwsqd_dwbh","rs_zsgwsqd_xzzwbm","rs_zsgwsqd_yrzsj","rs_zsgwsqd_ylzrq","rs_zsgwsqd_ylzyy","rs_zsgwsqd_xdwbh","rs_zsgwsqd_xxzzwbm","rs_zsgwsqd_xrzyy","rs_zsgwsqd_lrr","rs_zsgwsqd_lrsj","rs_zsgwsqd_lrbm","rs_zsgwsqd_bz","rs_zsgwsqd_clzt","rs_zsgwsqd_ztbm","rs_zsgwsqd_spxh","rs_zsgwsqd_shr","rs_zsgwsqd_shsj","rs_zsgwsqd_shjl","rs_zsgwsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteRs_zsgwsqd.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_zsgwsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">�޸�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(440);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="2%">����״̬</td>
	<td  width="5%">����״̬</td>
	<td  width="3%">�걨��˾</td>
	<td  width="3%">�����λ����</td>
	<td  width="4%">�����λ����</td>
	<td  width="2%">��������</td>
	<td  width="2%">��������</td>
	<td  width="12%">������������</td>
	<td  width="11%">����������Ա�ṹ</td>
	<td  width="11%">������λְ��</td>
	<td  width="7%">������λн�귶Χ</td>

	<td  width="2%">��������</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="8%">��ע</td>
	<td  width="2%">�������</td>
	<td  width="2%">�����</td>
	<td  width="2%">���ʱ��</td>
	<td  width="2%">��˽���</td>
	<td  width="8%">������</td>
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