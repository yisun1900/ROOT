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
	String yx_xxqmd_xqmc=null;
	String yx_xxqmd_dz=null;
	String yx_xxqmd_zt=null;
	String yx_xxqmd_lrr=null;
	String yx_xxqmd_lrsj=null;
	String yx_xxqmd_fgsbh=null;
	yx_xxqmd_xqmc=request.getParameter("yx_xxqmd_xqmc");
	if (yx_xxqmd_xqmc!=null)
	{
		yx_xxqmd_xqmc=cf.GB2Uni(yx_xxqmd_xqmc);
		if (!(yx_xxqmd_xqmc.equals("")))	wheresql+=" and  (yx_xxqmd.xqmc='"+yx_xxqmd_xqmc+"')";
	}
	yx_xxqmd_dz=request.getParameter("yx_xxqmd_dz");
	if (yx_xxqmd_dz!=null)
	{
		yx_xxqmd_dz=cf.GB2Uni(yx_xxqmd_dz);
		if (!(yx_xxqmd_dz.equals("")))	wheresql+=" and  (yx_xxqmd.dz='"+yx_xxqmd_dz+"')";
	}
	yx_xxqmd_zt=request.getParameter("yx_xxqmd_zt");
	if (yx_xxqmd_zt!=null)
	{
		yx_xxqmd_zt=cf.GB2Uni(yx_xxqmd_zt);
		if (!(yx_xxqmd_zt.equals("")))	wheresql+=" and  (yx_xxqmd.zt='"+yx_xxqmd_zt+"')";
	}
	yx_xxqmd_lrr=request.getParameter("yx_xxqmd_lrr");
	if (yx_xxqmd_lrr!=null)
	{
		yx_xxqmd_lrr=cf.GB2Uni(yx_xxqmd_lrr);
		if (!(yx_xxqmd_lrr.equals("")))	wheresql+=" and  (yx_xxqmd.lrr='"+yx_xxqmd_lrr+"')";
	}
	yx_xxqmd_lrsj=request.getParameter("yx_xxqmd_lrsj");
	if (yx_xxqmd_lrsj!=null)
	{
		yx_xxqmd_lrsj=yx_xxqmd_lrsj.trim();
		if (!(yx_xxqmd_lrsj.equals("")))	wheresql+="  and (yx_xxqmd.lrsj>=TO_DATE('"+yx_xxqmd_lrsj+"','YYYY/MM/DD'))";
	}
	yx_xxqmd_lrsj=request.getParameter("yx_xxqmd_lrsj2");
	if (yx_xxqmd_lrsj!=null)
	{
		yx_xxqmd_lrsj=yx_xxqmd_lrsj.trim();
		if (!(yx_xxqmd_lrsj.equals("")))	wheresql+="  and (yx_xxqmd.lrsj<=TO_DATE('"+yx_xxqmd_lrsj+"','YYYY/MM/DD'))";
	}
	yx_xxqmd_fgsbh=request.getParameter("yx_xxqmd_fgsbh");
	if (yx_xxqmd_fgsbh!=null)
	{
		yx_xxqmd_fgsbh=cf.GB2Uni(yx_xxqmd_fgsbh);
		if (!(yx_xxqmd_fgsbh.equals("")))	wheresql+=" and  (yx_xxqmd.fgsbh='"+yx_xxqmd_fgsbh+"')";
	}
	ls_sql="SELECT yx_xxqmd.xqmc,cqmc,yx_xxqmd.dz, DECODE(yx_xxqmd.zt,'1','δȷ��','2','��ȷ��'),yx_xxqmd.lrr,yx_xxqmd.lrsj,sq_dwxx.dwmc,dqmc,yx_xxqmd.dqbm  ";
	ls_sql+=" FROM sq_dwxx,yx_xxqmd,dm_cqbm,dm_dqbm  ";
    ls_sql+=" where yx_xxqmd.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and yx_xxqmd.cqbm=dm_cqbm.cqbm(+)";
    ls_sql+=" and yx_xxqmd.dqbm=dm_dqbm.dqbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and yx_xxqmd.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and yx_xxqmd.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by yx_xxqmd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yx_xxqmdQrList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//��������
	String[] keyName={"dqbm","xqmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ȷ��"};//��ť����ʾ����
	String[] buttonLink={"Yx_xxqmdQrList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update yx_xxqmd set zt='2' where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��С��������ȷ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="18%">С������</td>
	<td  width="9%">����</td>
	<td  width="24%">��һ���ͻ���ַ</td>
	<td  width="6%">״̬</td>
	<td  width="6%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="12%">�ֹ�˾</td>
	<td  width="7%">����</td>
	<td  width="7%">��������</td>
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