<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jc_tqzsxx_fgsbh=null;
	String jc_tqzsxx_zsxm=null;
	String jc_tqzsxx_jldw=null;
	String jc_tqzsxx_cbdj=null;
	String jc_tqzsxx_scdj=null;
	String jc_tqzsxx_zsslsx=null;
	String jc_tqzsxx_zsslxx=null;
	String jc_tqzsxx_sftz=null;
	jc_tqzsxx_fgsbh=request.getParameter("jc_tqzsxx_fgsbh");
	if (jc_tqzsxx_fgsbh!=null)
	{
		jc_tqzsxx_fgsbh=cf.GB2Uni(jc_tqzsxx_fgsbh);
		if (!(jc_tqzsxx_fgsbh.equals("")))	wheresql+=" and  (jc_tqzsxx.fgsbh='"+jc_tqzsxx_fgsbh+"')";
	}
	jc_tqzsxx_zsxm=request.getParameter("jc_tqzsxx_zsxm");
	if (jc_tqzsxx_zsxm!=null)
	{
		jc_tqzsxx_zsxm=cf.GB2Uni(jc_tqzsxx_zsxm);
		if (!(jc_tqzsxx_zsxm.equals("")))	wheresql+=" and  (jc_tqzsxx.zsxm='"+jc_tqzsxx_zsxm+"')";
	}
	jc_tqzsxx_jldw=request.getParameter("jc_tqzsxx_jldw");
	if (jc_tqzsxx_jldw!=null)
	{
		jc_tqzsxx_jldw=cf.GB2Uni(jc_tqzsxx_jldw);
		if (!(jc_tqzsxx_jldw.equals("")))	wheresql+=" and  (jc_tqzsxx.jldw='"+jc_tqzsxx_jldw+"')";
	}
	jc_tqzsxx_cbdj=request.getParameter("jc_tqzsxx_cbdj");
	if (jc_tqzsxx_cbdj!=null)
	{
		jc_tqzsxx_cbdj=jc_tqzsxx_cbdj.trim();
		if (!(jc_tqzsxx_cbdj.equals("")))	wheresql+=" and  (jc_tqzsxx.cbdj="+jc_tqzsxx_cbdj+") ";
	}
	jc_tqzsxx_scdj=request.getParameter("jc_tqzsxx_scdj");
	if (jc_tqzsxx_scdj!=null)
	{
		jc_tqzsxx_scdj=jc_tqzsxx_scdj.trim();
		if (!(jc_tqzsxx_scdj.equals("")))	wheresql+=" and  (jc_tqzsxx.scdj="+jc_tqzsxx_scdj+") ";
	}
	jc_tqzsxx_zsslsx=request.getParameter("jc_tqzsxx_zsslsx");
	if (jc_tqzsxx_zsslsx!=null)
	{
		jc_tqzsxx_zsslsx=jc_tqzsxx_zsslsx.trim();
		if (!(jc_tqzsxx_zsslsx.equals("")))	wheresql+=" and  (jc_tqzsxx.zsslsx="+jc_tqzsxx_zsslsx+") ";
	}
	jc_tqzsxx_zsslxx=request.getParameter("jc_tqzsxx_zsslxx");
	if (jc_tqzsxx_zsslxx!=null)
	{
		jc_tqzsxx_zsslxx=jc_tqzsxx_zsslxx.trim();
		if (!(jc_tqzsxx_zsslxx.equals("")))	wheresql+=" and  (jc_tqzsxx.zsslxx="+jc_tqzsxx_zsslxx+") ";
	}
	jc_tqzsxx_sftz=request.getParameter("jc_tqzsxx_sftz");
	if (jc_tqzsxx_sftz!=null)
	{
		jc_tqzsxx_sftz=cf.GB2Uni(jc_tqzsxx_sftz);
		if (!(jc_tqzsxx_sftz.equals("")))	wheresql+=" and  (jc_tqzsxx.sftz='"+jc_tqzsxx_sftz+"')";
	}
	ls_sql="SELECT jc_tqzsxx.fgsbh,sq_dwxx.dwmc, DECODE(jc_tqzsxx.sftz,'Y','��','N','��'),jc_tqzsxx.zsxm,jc_tqzsxx.jldw,jc_tqzsxx.cbdj,jc_tqzsxx.scdj,jc_tqzsxx.zsslsx,jc_tqzsxx.zsslxx,jc_tqzsxx.bz  ";
	ls_sql+=" FROM sq_dwxx,jc_tqzsxx  ";
    ls_sql+=" where jc_tqzsxx.fgsbh=sq_dwxx.dwbh(+)";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jc_tqzsxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_tqzsxx.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by jc_tqzsxx.fgsbh,jc_tqzsxx.sftz desc,jc_tqzsxx.zsxm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_tqzsxxCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"fgsbh","zsxm"};
	pageObj.setKey(keyName);
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
  <B><font size="3"> ��Ȩ������Ϣ����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�����ֹ�˾</td>
	<td  width="10%">�����ֹ�˾</td>
	<td  width="4%">�Ƿ�ֹͣ</td>
	<td  width="30%">������Ŀ</td>
	<td  width="6%">������λ</td>
	<td  width="6%">�ɱ�����</td>
	<td  width="6%">�г�����</td>
	<td  width="6%">������������</td>
	<td  width="6%">������������</td>
	<td  width="20%">��ע</td>
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