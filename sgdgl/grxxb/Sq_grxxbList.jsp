<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sq_grxxb_sgd=null;
	String sq_grxxb_bzmc=null;
	String sq_grxxb_xm=null;
	String sq_grxxb_xb=null;
	String sq_grxxb_jg=null;
	String sq_grxxb_csrq=null;
	String sq_grxxb_gz=null;
	String sq_grxxb_rzsj=null;
	String sq_grxxb_dj=null;
	String sq_grxxb_lx=null;
	String sq_grxxb_sfzh=null;
	String sq_grxxb_zz=null;
	String sq_grxxb_dh=null;

	String lzsj=null;
	lzsj=request.getParameter("lzsj");
	if (lzsj!=null)
	{
		lzsj=lzsj.trim();
		if (!(lzsj.equals("")))	wheresql+="  and (sq_grxxb.lzsj>=TO_DATE('"+lzsj+"','YYYY/MM/DD'))";
	}
	lzsj=request.getParameter("lzsj2");
	if (lzsj!=null)
	{
		lzsj=lzsj.trim();
		if (!(lzsj.equals("")))	wheresql+="  and (sq_grxxb.lzsj<=TO_DATE('"+lzsj+"','YYYY/MM/DD'))";
	}

	String sgzbh=null;
	sgzbh=request.getParameter("sgzbh");
	if (sgzbh!=null)
	{
		sgzbh=cf.GB2Uni(sgzbh);
		if (!(sgzbh.equals("")))	wheresql+=" and  (sq_grxxb.sgzbh like '%"+sgzbh+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_grxxb.ssfgs='"+fgs+"')";

	sq_grxxb_sgd=request.getParameter("sq_grxxb_sgd");
	if (sq_grxxb_sgd!=null)
	{
		sq_grxxb_sgd=cf.GB2Uni(sq_grxxb_sgd);
		if (!(sq_grxxb_sgd.equals("")))	wheresql+=" and  (sq_grxxb.sgd='"+sq_grxxb_sgd+"')";
	}
	sq_grxxb_bzmc=request.getParameter("sq_grxxb_bzmc");
	if (sq_grxxb_bzmc!=null)
	{
		sq_grxxb_bzmc=cf.GB2Uni(sq_grxxb_bzmc);
		if (!(sq_grxxb_bzmc.equals("")))	wheresql+=" and  (sq_grxxb.bzmc='"+sq_grxxb_bzmc+"')";
	}

	sq_grxxb_xm=request.getParameter("sq_grxxb_xm");
	if (sq_grxxb_xm!=null)
	{
		sq_grxxb_xm=cf.GB2Uni(sq_grxxb_xm);
		if (!(sq_grxxb_xm.equals("")))	wheresql+=" and  (sq_grxxb.xm='"+sq_grxxb_xm+"')";
	}
	sq_grxxb_xb=request.getParameter("sq_grxxb_xb");
	if (sq_grxxb_xb!=null)
	{
		sq_grxxb_xb=cf.GB2Uni(sq_grxxb_xb);
		if (!(sq_grxxb_xb.equals("")))	wheresql+=" and  (sq_grxxb.xb='"+sq_grxxb_xb+"')";
	}
	sq_grxxb_jg=request.getParameter("sq_grxxb_jg");
	if (sq_grxxb_jg!=null)
	{
		sq_grxxb_jg=cf.GB2Uni(sq_grxxb_jg);
		if (!(sq_grxxb_jg.equals("")))	wheresql+=" and  (sq_grxxb.jg='"+sq_grxxb_jg+"')";
	}
	sq_grxxb_csrq=request.getParameter("sq_grxxb_csrq");
	if (sq_grxxb_csrq!=null)
	{
		sq_grxxb_csrq=sq_grxxb_csrq.trim();
		if (!(sq_grxxb_csrq.equals("")))	wheresql+="  and (sq_grxxb.csrq>=TO_DATE('"+sq_grxxb_csrq+"','YYYY/MM/DD'))";
	}
	sq_grxxb_csrq=request.getParameter("sq_grxxb_csrq2");
	if (sq_grxxb_csrq!=null)
	{
		sq_grxxb_csrq=sq_grxxb_csrq.trim();
		if (!(sq_grxxb_csrq.equals("")))	wheresql+="  and (sq_grxxb.csrq<=TO_DATE('"+sq_grxxb_csrq+"','YYYY/MM/DD'))";
	}
	sq_grxxb_gz=request.getParameter("sq_grxxb_gz");
	if (sq_grxxb_gz!=null)
	{
		sq_grxxb_gz=cf.GB2Uni(sq_grxxb_gz);
		if (!(sq_grxxb_gz.equals("")))	wheresql+=" and  (sq_grxxb.gz='"+sq_grxxb_gz+"')";
	}
	sq_grxxb_rzsj=request.getParameter("sq_grxxb_rzsj");
	if (sq_grxxb_rzsj!=null)
	{
		sq_grxxb_rzsj=sq_grxxb_rzsj.trim();
		if (!(sq_grxxb_rzsj.equals("")))	wheresql+="  and (sq_grxxb.rzsj>=TO_DATE('"+sq_grxxb_rzsj+"','YYYY/MM/DD'))";
	}
	sq_grxxb_rzsj=request.getParameter("sq_grxxb_rzsj2");
	if (sq_grxxb_rzsj!=null)
	{
		sq_grxxb_rzsj=sq_grxxb_rzsj.trim();
		if (!(sq_grxxb_rzsj.equals("")))	wheresql+="  and (sq_grxxb.rzsj<=TO_DATE('"+sq_grxxb_rzsj+"','YYYY/MM/DD'))";
	}
	sq_grxxb_dj=request.getParameter("sq_grxxb_dj");
	if (sq_grxxb_dj!=null)
	{
		sq_grxxb_dj=cf.GB2Uni(sq_grxxb_dj);
		if (!(sq_grxxb_dj.equals("")))	wheresql+=" and  (sq_grxxb.dj='"+sq_grxxb_dj+"')";
	}
	sq_grxxb_lx=request.getParameter("sq_grxxb_lx");
	if (sq_grxxb_lx!=null)
	{
		sq_grxxb_lx=cf.GB2Uni(sq_grxxb_lx);
		if (!(sq_grxxb_lx.equals("")))	wheresql+=" and  (sq_grxxb.lx='"+sq_grxxb_lx+"')";
	}
	sq_grxxb_sfzh=request.getParameter("sq_grxxb_sfzh");
	if (sq_grxxb_sfzh!=null)
	{
		sq_grxxb_sfzh=cf.GB2Uni(sq_grxxb_sfzh);
		if (!(sq_grxxb_sfzh.equals("")))	wheresql+=" and  (sq_grxxb.sfzh='"+sq_grxxb_sfzh+"')";
	}
	sq_grxxb_zz=request.getParameter("sq_grxxb_zz");
	if (sq_grxxb_zz!=null)
	{
		sq_grxxb_zz=cf.GB2Uni(sq_grxxb_zz);
		if (!(sq_grxxb_zz.equals("")))	wheresql+=" and  (sq_grxxb.zz='"+sq_grxxb_zz+"')";
	}
	sq_grxxb_dh=request.getParameter("sq_grxxb_dh");
	if (sq_grxxb_dh!=null)
	{
		sq_grxxb_dh=cf.GB2Uni(sq_grxxb_dh);
		if (!(sq_grxxb_dh.equals("")))	wheresql+=" and  (sq_grxxb.dh='"+sq_grxxb_dh+"')";
	}
	ls_sql="SELECT dwmc,sq_grxxb.ssfgs,sq_sgd.sgdmc,sq_grxxb.bzmc,sq_grxxb.lx,sq_grxxb.xm,sq_grxxb.dj,sq_grxxb.xb,sq_grxxb.jg,sq_grxxb.csrq,sq_grxxb.gz,sq_grxxb.rzsj,sq_grxxb.lzsj,sq_grxxb.sgzbh,sq_grxxb.sfzh,sq_grxxb.yhk,sq_grxxb.zz,sq_grxxb.dh,sq_grxxb.jjlxr,sq_grxxb.jjlxrdh,sq_grxxb.jjlxrdz,sq_grxxb.pxsm  ";
	ls_sql+=" FROM sq_grxxb,sq_sgd,sq_dwxx  ";
    ls_sql+=" where sq_grxxb.sgd=sq_sgd.sgd(+) and sq_grxxb.ssfgs=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_grxxb.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_grxxb.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_grxxb.ssfgs,sq_grxxb.sgd,sq_grxxb.bzmc,sq_grxxb.xm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_grxxbList.jsp","","","EditSq_grxxb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sgd","sq_sgd_sgdmc","bzmc","xm","sq_grxxb_xb","sq_grxxb_jg","sq_grxxb_csrq","sq_grxxb_gz","sq_grxxb_rzsj","sq_grxxb_dj","sq_grxxb_lx","sq_grxxb_sfzh","sq_grxxb_zz","sq_grxxb_dh","sq_grxxb_pxsm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ssfgs","xm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ","������ְ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSq_grxxb.jsp","pllz.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("ssfgs","1");//�в����������Hash��
	spanColHash.put("sgdmc","1");//�в����������Hash��
	spanColHash.put("bzmc","1");//�в����������Hash��
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
  <B><font size="3">ά������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">�ֹ�˾</td>
	<td  width="3%">�ֹ�˾</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�೤</td>
	<td  width="3%">����</td>
	<td  width="3%">����</td>
	<td  width="4%">�ȼ�</td>
	<td  width="2%">�Ա�</td>
	<td  width="8%">����</td>
	<td  width="4%">��������</td>
	<td  width="3%">����</td>
	<td  width="4%">��ְʱ��</td>
	<td  width="4%">��ְʱ��</td>
	<td  width="5%">�ϸ�֤���</td>
	<td  width="6%">���֤��</td>
	<td  width="6%">���п�</td>
	<td  width="6%">סַ</td>
	<td  width="6%">�绰</td>
	<td  width="2%">������ϵ��</td>
	<td  width="5%">��ϵ�˵绰</td>
	<td  width="5%">������ϵ�˵�ַ</td>
	<td  width="9%">��ѵ˵��</td>
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