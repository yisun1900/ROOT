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
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_dwxx.ssfgs='"+ssfgs+"')";
	}

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+dwbh+"')";
	}

	ls_sql="SELECT cw_dmkhjl.nian,cw_dmkhjl.yue,sq_dwxx.dwbh,dwmc,(select dwmc from sq_dwxx b where b.dwbh=sq_dwxx.ssfgs) ssfgs,ssfwmc,dwjbmc,dmxsmc,bzrs,sq_dwxx.kdsj,sq_dwxx.gdsj";
	ls_sql+=" FROM sq_dwxx,dm_ssfw,dm_dwjb,dm_dmxs,cw_dmkhjl  ";
    ls_sql+=" where sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+)";
    ls_sql+=" and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
    ls_sql+=" and sq_dwxx.dwbh=cw_dmkhjl.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dqbm,sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.dwlx,sq_dwxx.dwbh,cw_dmkhjl.nian,cw_dmkhjl.yue";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_dmkhjlCxList.jsp","SelectCxCw_dmkhjl.jsp","ViewCw_dmkhjl.jsp","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dwbh","sq_dwxx_dwmc","sq_dwxx_dwjc","sq_dwxx_ssdw","sq_dwxx_dwlx","sq_dwxx_dwfzr","sq_dwxx_dwdh","dm_fgflbm_fgflmc","dm_ysbm_ysmc","dm_cqbm_cqmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dwbh","nian","yue"};
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
  <B><font size="3">��ѯ����������Ӫͳ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="6%">��</td>
	<td  width="6%">��</td>
	<td  width="6%">���</td>
	<td  width="15%">��λ����</td>
	<td  width="11%">�����ֹ�˾</td>
	<td  width="8%">������λ</td>
	<td  width="8%">��λ����</td>
	<td  width="8%">������ʽ</td>
	<td  width="8%">��׼����</td>
	<td  width="8%">����ʱ��</td>
	<td  width="8%">�ص�ʱ��</td>
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