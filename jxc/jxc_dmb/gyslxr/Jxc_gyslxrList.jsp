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
	String xh=null;
	String gysbm=null;
	String lxrxm=null;
	String zw=null;
	String sj=null;
	String bgdh=null;
	String cz=null;
	String sflz=null;
	String bz=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (jxc_gyslxr.xh="+xh+") ";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (jxc_gyslxr.gysbm="+gysbm+") ";
	}
	lxrxm=request.getParameter("lxrxm");
	if (lxrxm!=null)
	{
		lxrxm=cf.GB2Uni(lxrxm);
		if (!(lxrxm.equals("")))	wheresql+=" and  (jxc_gyslxr.lxrxm='"+lxrxm+"')";
	}
	zw=request.getParameter("zw");
	if (zw!=null)
	{
		zw=cf.GB2Uni(zw);
		if (!(zw.equals("")))	wheresql+=" and  (jxc_gyslxr.zw='"+zw+"')";
	}
	sj=request.getParameter("sj");
	if (sj!=null)
	{
		sj=cf.GB2Uni(sj);
		if (!(sj.equals("")))	wheresql+=" and  (jxc_gyslxr.sj='"+sj+"')";
	}
	bgdh=request.getParameter("bgdh");
	if (bgdh!=null)
	{
		bgdh=cf.GB2Uni(bgdh);
		if (!(bgdh.equals("")))	wheresql+=" and  (jxc_gyslxr.bgdh='"+bgdh+"')";
	}
	cz=request.getParameter("cz");
	if (cz!=null)
	{
		cz=cf.GB2Uni(cz);
		if (!(cz.equals("")))	wheresql+=" and  (jxc_gyslxr.cz='"+cz+"')";
	}
	sflz=request.getParameter("sflz");
	if (sflz!=null)
	{
		sflz=cf.GB2Uni(sflz);
		if (!(sflz.equals("")))	wheresql+=" and  (jxc_gyslxr.sflz='"+sflz+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_gyslxr.bz='"+bz+"')";
	}
	ls_sql="SELECT xh,gysmc,lxrxm,zw,sj,bgdh,cz,DECODE(sflz,'Y','��ְ','N','��ְ') sflz,jxc_gyslxr.bz  ";
	ls_sql+=" FROM jxc_gyslxr,jxc_gysxx  ";
    ls_sql+=" where jxc_gyslxr.gysbm=jxc_gysxx.gysbm";
    ls_sql+=wheresql;
	ls_sql+=" order by gysmc ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_gyslxrList.jsp","","","EditJxc_gyslxr.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","gysbm","lxrxm","zw","sj","bgdh","cz","sflz","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jxc_gyslxrList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jxc_gyslxr where "+chooseitem;
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
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">���</td>
	<td  width="15%">��Ӧ��</td>
	<td  width="5%">��ϵ������</td>
	<td  width="10%">ְ��</td>
	<td  width="15%">�ֻ�</td>
	<td  width="15%">�칫�绰</td>
	<td  width="12%">����</td>
	<td  width="3%">�Ƿ���ְ</td>
	<td  width="18%">��ע</td>
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