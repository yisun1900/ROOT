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
	String dm_ysshxmbm_shxmbm=null;
	String dm_ysshxmbm_shxmmc=null;
	String dm_ysshxmbm_shxmdlbm=null;
	String dm_ysshxmbm_shxmxlbm=null;
	String dm_ysshxmbm_kf=null;

	String kfgz=null;
	kfgz=request.getParameter("kfgz");
	if (kfgz!=null)
	{
		kfgz=cf.GB2Uni(kfgz);
		if (!(kfgz.equals("")))	wheresql+=" and  (dm_ysshxmbm.kfgz='"+kfgz+"')";
	}

	
	dm_ysshxmbm_shxmbm=request.getParameter("dm_ysshxmbm_shxmbm");
	if (dm_ysshxmbm_shxmbm!=null)
	{
		dm_ysshxmbm_shxmbm=cf.GB2Uni(dm_ysshxmbm_shxmbm);
		if (!(dm_ysshxmbm_shxmbm.equals("")))	wheresql+=" and  (dm_ysshxmbm.shxmbm='"+dm_ysshxmbm_shxmbm+"')";
	}
	dm_ysshxmbm_shxmmc=request.getParameter("dm_ysshxmbm_shxmmc");
	if (dm_ysshxmbm_shxmmc!=null)
	{
		dm_ysshxmbm_shxmmc=cf.GB2Uni(dm_ysshxmbm_shxmmc);
		if (!(dm_ysshxmbm_shxmmc.equals("")))	wheresql+=" and  (dm_ysshxmbm.shxmmc like '%"+dm_ysshxmbm_shxmmc+"%')";
	}
	dm_ysshxmbm_shxmdlbm=request.getParameter("dm_ysshxmbm_shxmdlbm");
	if (dm_ysshxmbm_shxmdlbm!=null)
	{
		dm_ysshxmbm_shxmdlbm=cf.GB2Uni(dm_ysshxmbm_shxmdlbm);
		if (!(dm_ysshxmbm_shxmdlbm.equals("")))	wheresql+=" and  (dm_ysshxmbm.shxmdlbm='"+dm_ysshxmbm_shxmdlbm+"')";
	}
	dm_ysshxmbm_shxmxlbm=request.getParameter("dm_ysshxmbm_shxmxlbm");
	if (dm_ysshxmbm_shxmxlbm!=null)
	{
		dm_ysshxmbm_shxmxlbm=cf.GB2Uni(dm_ysshxmbm_shxmxlbm);
		if (!(dm_ysshxmbm_shxmxlbm.equals("")))	wheresql+=" and  (dm_ysshxmbm.shxmxlbm='"+dm_ysshxmbm_shxmxlbm+"')";
	}
	dm_ysshxmbm_kf=request.getParameter("dm_ysshxmbm_kf");
	if (dm_ysshxmbm_kf!=null)
	{
		dm_ysshxmbm_kf=dm_ysshxmbm_kf.trim();
		if (!(dm_ysshxmbm_kf.equals("")))	wheresql+=" and (dm_ysshxmbm.kf="+dm_ysshxmbm_kf+") ";
	}
	ls_sql="SELECT shxmdlmc,shxmxlmc,dm_ysshxmbm.shxmbm,dm_ysshxmbm.shxmmc,dm_ysshxmbm.kf,DECODE(dm_ysshxmbm.kfgz,'1','��2����˿�ʼ�۷�','2','ÿ�ζ��۷�','3','��ͬ��Ŀ����2�ο�ʼ�۷�','4','��ͬ��Ŀֻ��1�η�'),dm_ysshxmbm.bz  ";
	ls_sql+=" FROM dm_ysshxmbm,dm_ysshxmdlbm,dm_ysshxmxlbm  ";
    ls_sql+=" where dm_ysshxmbm.shxmxlbm=dm_ysshxmxlbm.shxmxlbm and dm_ysshxmbm.shxmdlbm=dm_ysshxmdlbm.shxmdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_ysshxmbm.shxmdlbm,dm_ysshxmbm.shxmxlbm,shxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_shxmbmList.jsp","SelectDm_shxmbm.jsp","","EditDm_shxmbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"shxmbm","dm_ysshxmbm_shxmmc","dm_ysshxmdlbm_shxmdlmc","dm_ysshxmxlbm_shxmxlmc","dm_ysshxmbm_kf"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"shxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_shxmbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("shxmdlmc","1");//�в����������Hash��
	spanColHash.put("shxmxlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] shxmbm = request.getParameterValues("shxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shxmbm,"shxmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_ysshxmbm where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">�����Ŀ����</td>
	<td  width="8%">�����ĿС��</td>
	<td  width="6%">�����Ŀ����</td>
	<td  width="24%">�����Ŀ����</td>
	<td  width="6%">�۷�</td>
	<td  width="11%">�۷ֹ���</td>
	<td  width="31%">��ע</td>
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