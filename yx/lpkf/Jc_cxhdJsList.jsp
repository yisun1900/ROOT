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
	String jc_cxhd_cxhdbm=null;
	String jc_cxhd_cxhdmc=null;
	String jc_cxhd_fgsbh=null;
	String jc_cxhd_dj=null;
	String jc_cxhd_qdhdzk=null;
	String jc_cxhd_zjxhdzk=null;
	String jc_cxhd_glfzk=null;
	String jc_cxhd_fjmc=null;
	String jc_cxhd_jsbz=null;
	String jc_cxhd_spbz=null;

	String hdlx=null;
	String zklx=null;
	hdlx=request.getParameter("hdlx");
	if (hdlx!=null)
	{
		hdlx=cf.GB2Uni(hdlx);
		if (!(hdlx.equals("")))	wheresql+=" and  (jc_cxhd.hdlx='"+hdlx+"')";
	}
	zklx=request.getParameter("zklx");
	if (zklx!=null)
	{
		zklx=cf.GB2Uni(zklx);
		if (!(zklx.equals("")))	wheresql+=" and  (jc_cxhd.zklx='"+zklx+"')";
	}

	String kgxqthd=null;
	kgxqthd=request.getParameter("kgxqthd");
	if (kgxqthd!=null)
	{
		kgxqthd=cf.GB2Uni(kgxqthd);
		if (!(kgxqthd.equals("")))	wheresql+=" and  (jc_cxhd.kgxqthd='"+kgxqthd+"')";
	}

	jc_cxhd_cxhdbm=request.getParameter("jc_cxhd_cxhdbm");
	if (jc_cxhd_cxhdbm!=null)
	{
		jc_cxhd_cxhdbm=cf.GB2Uni(jc_cxhd_cxhdbm);
		if (!(jc_cxhd_cxhdbm.equals("")))	wheresql+=" and  (jc_cxhd.cxhdbm='"+jc_cxhd_cxhdbm+"')";
	}
	jc_cxhd_cxhdmc=request.getParameter("jc_cxhd_cxhdmc");
	if (jc_cxhd_cxhdmc!=null)
	{
		jc_cxhd_cxhdmc=cf.GB2Uni(jc_cxhd_cxhdmc);
		if (!(jc_cxhd_cxhdmc.equals("")))	wheresql+=" and  (jc_cxhd.cxhdmc like '%"+jc_cxhd_cxhdmc+"%')";
	}
	jc_cxhd_fgsbh=request.getParameter("jc_cxhd_fgsbh");
	if (jc_cxhd_fgsbh!=null)
	{
		jc_cxhd_fgsbh=cf.GB2Uni(jc_cxhd_fgsbh);
		if (!(jc_cxhd_fgsbh.equals("")))	wheresql+=" and  (jc_cxhd.fgsbh='"+jc_cxhd_fgsbh+"')";
	}
	jc_cxhd_dj=request.getParameter("jc_cxhd_dj");
	if (jc_cxhd_dj!=null)
	{
		jc_cxhd_dj=jc_cxhd_dj.trim();
		if (!(jc_cxhd_dj.equals("")))	wheresql+=" and (jc_cxhd.dj="+jc_cxhd_dj+") ";
	}
	jc_cxhd_qdhdzk=request.getParameter("jc_cxhd_qdhdzk");
	if (jc_cxhd_qdhdzk!=null)
	{
		jc_cxhd_qdhdzk=jc_cxhd_qdhdzk.trim();
		if (!(jc_cxhd_qdhdzk.equals("")))	wheresql+=" and  (jc_cxhd.qdhdzk="+jc_cxhd_qdhdzk+") ";
	}
	jc_cxhd_zjxhdzk=request.getParameter("jc_cxhd_zjxhdzk");
	if (jc_cxhd_zjxhdzk!=null)
	{
		jc_cxhd_zjxhdzk=jc_cxhd_zjxhdzk.trim();
		if (!(jc_cxhd_zjxhdzk.equals("")))	wheresql+=" and  (jc_cxhd.zjxhdzk="+jc_cxhd_zjxhdzk+") ";
	}
	jc_cxhd_glfzk=request.getParameter("jc_cxhd_glfzk");
	if (jc_cxhd_glfzk!=null)
	{
		jc_cxhd_glfzk=jc_cxhd_glfzk.trim();
		if (!(jc_cxhd_glfzk.equals("")))	wheresql+=" and  (jc_cxhd.glfzk="+jc_cxhd_glfzk+") ";
	}
	jc_cxhd_fjmc=request.getParameter("jc_cxhd_fjmc");
	if (jc_cxhd_fjmc!=null)
	{
		jc_cxhd_fjmc=cf.GB2Uni(jc_cxhd_fjmc);
		if (!(jc_cxhd_fjmc.equals("")))	wheresql+=" and  (jc_cxhd.fjmc='"+jc_cxhd_fjmc+"')";
	}
	jc_cxhd_jsbz=request.getParameter("jc_cxhd_jsbz");
	if (jc_cxhd_jsbz!=null)
	{
		jc_cxhd_jsbz=cf.GB2Uni(jc_cxhd_jsbz);
		if (!(jc_cxhd_jsbz.equals("")))	wheresql+=" and  (jc_cxhd.jsbz='"+jc_cxhd_jsbz+"')";
	}
	jc_cxhd_spbz=request.getParameter("jc_cxhd_spbz");
	if (jc_cxhd_spbz!=null)
	{
		jc_cxhd_spbz=cf.GB2Uni(jc_cxhd_spbz);
		if (!(jc_cxhd_spbz.equals("")))	wheresql+=" and  (jc_cxhd.spbz='"+jc_cxhd_spbz+"')";
	}
	ls_sql="SELECT jc_cxhd.cxhdbm,jc_cxhd.cxhdmc,DECODE(jc_cxhd.zklx,'1','ǩ������','2','�������(����ǰ�ռ�װ��)','3','�������(���ۺ��ռ�װ��)','4','���ۿ�') zklx, sq_dwxx.dwmc, DECODE(jc_cxhd.jsbz,'N','δ����','Y','����') jsbz,jc_cxhdsj.kssj,jc_cxhdsj.cxjssj,jc_cxhdsj.qdjssj,jc_cxhd.dj,jc_cxhd.qdhdzk,jc_cxhd.zjxhdzk,jc_cxhd.glfzk,'<A HREF=\"/jcjj/cxhd/file/'||jc_cxhd.fjmc||'\" target=\"_blank\">'||jc_cxhd.fjmc||'</A>' fjmc, DECODE(jc_cxhd.hdlx,'1','�޻','2','��˾�','3','С���','4','չ��','5','�г��') hdlx, DECODE(jc_cxhd.kgxqthd,'1','���ɹ���','2','�ɹ���') kgxqthd, DECODE(jc_cxhd.spbz,'N','δ����','Y','����') spbz,jc_cxhd.hdxgxq,jc_cxhd.bz  ";
	ls_sql+=" FROM jc_cxhd,sq_dwxx,jc_cxhdsj  ";
    ls_sql+=" where jc_cxhd.fgsbh=sq_dwxx.dwbh";
    ls_sql+=" and jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cxhdsj.qdjssj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cxhdJsList.jsp","SelectJsJc_cxhd.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cxhdbm","jc_cxhd_cxhdmc","sq_dwxx_dwmc","jc_cxhd_dj","jc_cxhd_qdhdzk","jc_cxhd_zjxhdzk","jc_cxhd_glfzk","jc_cxhd_fjmc","jc_cxhd_hdlx","jc_cxhd_zklx","jc_cxhd_jsbz","jc_cxhd_spbz","jc_cxhd_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cxhdbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"�����","ɾ������"};//��ť����ʾ����
	String[] buttonLink={"Jc_cxhdJsList.jsp?jsbz=Y","Jc_cxhdJsList.jsp?jsbz=N"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


	pageObj.alignStr[15]="align='left'";
	pageObj.alignStr[16]="align='left'";

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cxhdbm","1");//�в����������Hash��
	spanColHash.put("cxhdmc","1");//�в����������Hash��
	spanColHash.put("zklx","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("jsbz","1");//�в����������Hash��

	spanColHash.put("dj","1");//�в����������Hash��
	spanColHash.put("qdhdzk","1");//�в����������Hash��
	spanColHash.put("zjxhdzk","1");//�в����������Hash��
	spanColHash.put("glfzk","1");//�в����������Hash��
	spanColHash.put("fjmc","1");//�в����������Hash��
	spanColHash.put("hdlx","1");//�в����������Hash��
	spanColHash.put("kgxqthd","1");//�в����������Hash��
	spanColHash.put("spbz","1");//�в����������Hash��
	spanColHash.put("hdxgxq","1");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��

	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String jsbz=request.getParameter("jsbz");
	String[] cxhdbm = request.getParameterValues("cxhdbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cxhdbm,"cxhdbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update jc_cxhd set jsbz='"+jsbz+"' where "+chooseitem;
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
  <B><font size="3">��������������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">���������</td>
	<td  width="10%">���������</td>
	<td  width="4%">�ۿ�����</td>
	<td  width="5%">�ֹ�˾</td>
	<td  width="3%">������־</td>
	<td  width="4%">��ʼʱ��(>=)</td>
	<td  width="4%">��������ʱ��(<=)</td>
	<td  width="4%">ǩ������ʱ��(<=)</td>
	<td  width="4%">��Ͷ���</td>
	<td  width="3%">���̷�ǩ���ۿ�</td>
	<td  width="3%">���̷��������ۿ�</td>
	<td  width="3%">������ۿ�</td>
	<td  width="10%">��������</td>
	<td  width="3%">�����</td>
	<td  width="3%">�ɹ��������</td>
	<td  width="3%">������־</td>
	<td  width="7%">����С��</td>
	<td  width="23%">��ע</td>
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