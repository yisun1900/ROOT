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
	String sq_bzxx_bzmc=null;
	String sgd=null;
	String sq_bzxx_xb=null;
	String sq_bzxx_dh=null;
	String sq_bzxx_zz=null;
	String sq_bzxx_sfzh=null;
	String sq_bzxx_bz=null;

	String rzsj=null;
	rzsj=request.getParameter("rzsj");
	if (rzsj!=null)
	{
		rzsj=cf.GB2Uni(rzsj);
		if (!(rzsj.equals("")))	wheresql+="  and (sq_bzxx.rzsj>=TO_DATE('"+rzsj+"','YYYY-MM-DD'))";
	}
	rzsj=request.getParameter("rzsj2");
	if (rzsj!=null)
	{
		rzsj=cf.GB2Uni(rzsj);
		if (!(rzsj.equals("")))	wheresql+="  and (sq_bzxx.rzsj<=TO_DATE('"+rzsj+"','YYYY-MM-DD'))";
	}
	String lzsj=null;
	lzsj=request.getParameter("lzsj");
	if (lzsj!=null)
	{
		lzsj=cf.GB2Uni(lzsj);
		if (!(lzsj.equals("")))	wheresql+="  and (sq_bzxx.lzsj>=TO_DATE('"+lzsj+"','YYYY-MM-DD'))";
	}
	lzsj=request.getParameter("lzsj2");
	if (lzsj!=null)
	{
		lzsj=cf.GB2Uni(lzsj);
		if (!(lzsj.equals("")))	wheresql+="  and (sq_bzxx.lzsj<=TO_DATE('"+lzsj+"','YYYY-MM-DD'))";
	}


	String tdbz=null;
	tdbz=request.getParameter("tdbz");
	if (tdbz!=null)
	{
		tdbz=cf.GB2Uni(tdbz);
		if (!(tdbz.equals("")))	wheresql+=" and  (sq_bzxx.tdbz='"+tdbz+"')";
	}

	String sfqldht=null;
	sfqldht=request.getParameter("sfqldht");
	if (sfqldht!=null)
	{
		if (!(sfqldht.equals("")))	wheresql+=" and  (sq_bzxx.sfqldht='"+sfqldht+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_sgd.ssfgs='"+fgs+"')";

	sq_bzxx_bzmc=request.getParameter("sq_bzxx_bzmc");
	if (sq_bzxx_bzmc!=null)
	{
		sq_bzxx_bzmc=cf.GB2Uni(sq_bzxx_bzmc);
		if (!(sq_bzxx_bzmc.equals("")))	wheresql+=" and  (sq_bzxx.bzmc='"+sq_bzxx_bzmc+"')";
	}
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (sq_bzxx.sgd='"+sgd+"')";
	}
	sq_bzxx_xb=request.getParameter("sq_bzxx_xb");
	if (sq_bzxx_xb!=null)
	{
		sq_bzxx_xb=cf.GB2Uni(sq_bzxx_xb);
		if (!(sq_bzxx_xb.equals("")))	wheresql+=" and  (sq_bzxx.xb='"+sq_bzxx_xb+"')";
	}
	sq_bzxx_dh=request.getParameter("sq_bzxx_dh");
	if (sq_bzxx_dh!=null)
	{
		sq_bzxx_dh=cf.GB2Uni(sq_bzxx_dh);
		if (!(sq_bzxx_dh.equals("")))	wheresql+=" and  (sq_bzxx.dh='"+sq_bzxx_dh+"')";
	}
	sq_bzxx_zz=request.getParameter("sq_bzxx_zz");
	if (sq_bzxx_zz!=null)
	{
		sq_bzxx_zz=cf.GB2Uni(sq_bzxx_zz);
		if (!(sq_bzxx_zz.equals("")))	wheresql+=" and  (sq_bzxx.zz='"+sq_bzxx_zz+"')";
	}
	sq_bzxx_sfzh=request.getParameter("sq_bzxx_sfzh");
	if (sq_bzxx_sfzh!=null)
	{
		sq_bzxx_sfzh=cf.GB2Uni(sq_bzxx_sfzh);
		if (!(sq_bzxx_sfzh.equals("")))	wheresql+=" and  (sq_bzxx.sfzh='"+sq_bzxx_sfzh+"')";
	}
	sq_bzxx_bz=request.getParameter("sq_bzxx_bz");
	if (sq_bzxx_bz!=null)
	{
		sq_bzxx_bz=cf.GB2Uni(sq_bzxx_bz);
		if (!(sq_bzxx_bz.equals("")))	wheresql+=" and  (sq_bzxx.bz='"+sq_bzxx_bz+"')";
	}
	ls_sql="SELECT sq_bzxx.bzmc, DECODE(sq_bzxx.xb,'M','��','W','Ů') xb,sgdjbmc,grsl,yygrsl,kygrsl,DECODE(sq_bzxx.tdbz,'Y','ͣ��','N','����','K','����','L','��ְ') tdbz,sq_bzxx.rzsj,sq_bzxx.lzsj,sq_bzxx.dh,sq_bzxx.sgd,sq_sgd.sgdmc,dwmc,DECODE(sq_bzxx.sfqldht,'N','<font color=\"#FF0000\">��</font>','Y','��') sfqldht,sq_bzxx.khmyd||'%' khmyd,sq_bzxx.mqzsgds,sq_bzxx.zxzsgds,sq_bzxx.zdzsgds,sq_bzxx.kjdzxz,sq_bzxx.kjdzdz,sq_bzxx.zz,sq_bzxx.sfzh,sq_bzxx.jjlxr,sq_bzxx.jjlxrdh,sq_bzxx.jjlxrdz,sq_bzxx.bz  ";
	ls_sql+=" FROM sq_sgd,sq_bzxx,sq_dwxx,sq_sgdjbbm  ";
    ls_sql+=" where sq_bzxx.sgd=sq_sgd.sgd(+) and sq_sgd.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=" and sq_bzxx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_sgd.ssfgs,sq_sgd.sgdmc,bzmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_bzxxList.jsp","SelectSq_bzxx.jsp","","EditSq_bzxx.jsp");
	pageObj.setPageRow(20);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"bzmc","sgdjbmc","grsl","yygrsl","kygrsl","tdbz","xb","dh","sgdmc","rzsj","lzsj","dwmc","sfqldht","khmyd","mqzsgds","zxzsgds","zdzsgds","kjdzxz","kjdzdz","zz","sfzh","jjlxr","jjlxrdh","jjlxrdz","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"bzmc","sgd"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSq_bzxx.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgdmc","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�೤</td>
	<td  width="3%">����</td>
	<td  width="2%">��������</td>
	<td  width="2%">���ù�������</td>
	<td  width="2%">���ù�������</td>
	<td  width="2%">״̬</td>
	<td  width="2%">�Ա�</td>
	<td  width="9%">�绰</td>
	<td  width="3%">ʩ����</td>
	<td  width="4%">��ְʱ��</td>
	<td  width="4%">��ְʱ��</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="2%">ǩ�Ͷ���ͬ</td>
	<td  width="3%">�ͻ������</td>
	<td  width="3%">Ŀǰ��ʩ����</td>
	<td  width="3%">��С��ʩ����</td>
	<td  width="3%">�����ʩ����</td>
	<td  width="4%">�ɽӵ���Сֵ</td>
	<td  width="4%">�ɽӵ����ֵ</td>
	<td  width="6%">סַ</td>
	<td  width="6%">���֤��</td>
	<td  width="3%">������ϵ��</td>
	<td  width="7%">��ϵ�˵绰</td>
	<td  width="6%">������ϵ�˵�ַ</td>
	<td  width="9%">��ע</td>
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