<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String clbm=null;
	String clmc=null;
	String cldlbm=null;
	String xh=null;
	String gg=null;
	String lsj=null;
	String xsj=null;
	String zp=null;
	String cllbbm=null;
	String clysbm=null;
	String jldwbm=null;
	String sfbhpj=null;
	String pjts=null;

	String nbbm=null;
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm like '%"+nbbm+"%')";
	}

	String sftjcp=null;
	sftjcp=request.getParameter("sftjcp");
	if (sftjcp!=null)
	{
		sftjcp=cf.GB2Uni(sftjcp);
		if (!(sftjcp.equals("")))	wheresql+=" and  (jxc_cljgb.sftjcp='"+sftjcp+"')";
	}

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
//		if (!(lrbm.equals("")))	wheresql+=" and  (jxc_clbm.lrbm='"+lrbm+"')";
	}

	String xhlist[]=request.getParameterValues("xhlist");
	xh=request.getParameter("xh");

	String mhcx=request.getParameter("mhcx");
	if (mhcx.equals("Y"))
	{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jxc_clbm.xh like '%"+getxh+"%')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (xh!=null)
			{
				xh=cf.GB2Uni(xh);
				if (!(xh.equals("")))	wheresql+=" and  (jxc_clbm.xh like '%"+xh+"%')";
			}
		}
	}
	else{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jxc_clbm.xh='"+getxh+"')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (xh!=null)
			{
				xh=cf.GB2Uni(xh);
				if (!(xh.equals("")))	wheresql+=" and  (jxc_clbm.xh='"+xh+"')";
			}
		}
	}


	String cxhdbl=null;
	cxhdbl=request.getParameter("cxhdbl");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jxc_cljgb.cxhdbl>="+cxhdbl+")";
	}
	cxhdbl=request.getParameter("cxhdbl2");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jxc_cljgb.cxhdbl<="+cxhdbl+")";
	}

	String scsmc=null;
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (jxc_clbm.scsmc='"+scsmc+"')";
	}
	String scsmc2=null;
	scsmc2=request.getParameter("scsmc2");
	if (scsmc2!=null)
	{
		scsmc2=cf.GB2Uni(scsmc2);
		if (!(scsmc2.equals("")))	wheresql+=" and  (jxc_clbm.scsmc like '%"+scsmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jxc_clbm.ppmc like '%"+ppmc2+"%')";
	}
	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_cljgb.gysmc='"+gysmc+"')";
	}
	String gysmc2=null;
	gysmc2=request.getParameter("gysmc2");
	if (gysmc2!=null)
	{
		gysmc2=cf.GB2Uni(gysmc2);
		if (!(gysmc2.equals("")))	wheresql+=" and  (jxc_cljgb.gysmc like '%"+gysmc2+"%')";
	}

	String clxlbm=null;
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clbm.clxlbm='"+clxlbm+"')";
	}


	String sfyh=null;
	sfyh=request.getParameter("sfyh");
	if (sfyh!=null)
	{
		if (!(sfyh.equals("")))	wheresql+=" and  (jxc_cljgb.sfyh='"+sfyh+"')";
	}

	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		if (!(sfycx.equals("")))	wheresql+=" and  (jxc_cljgb.sfycx='"+sfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jxc_cljgb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jxc_cljgb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjzsj=null;
	cxjzsj=request.getParameter("cxjzsj");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jxc_cljgb.cxjzsj>=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}
	cxjzsj=request.getParameter("cxjzsj2");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jxc_cljgb.cxjzsj<=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}
	
	
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (jxc_clbm.clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (jxc_clbm.clmc like '%"+clmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_clbm.cldlbm='"+cldlbm+"')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (jxc_clbm.gg like '%"+gg+"%')";
	}
	lsj=request.getParameter("lsj");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (jxc_cljgb.lsj>="+lsj+") ";
	}
	lsj=request.getParameter("lsj2");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (jxc_cljgb.lsj<="+lsj+") ";
	}
	xsj=request.getParameter("xsj");
	if (xsj!=null)
	{
		xsj=xsj.trim();
		if (!(xsj.equals("")))	wheresql+=" and  (jxc_cljgb.xsj>="+xsj+") ";
	}
	xsj=request.getParameter("xsj2");
	if (xsj!=null)
	{
		xsj=xsj.trim();
		if (!(xsj.equals("")))	wheresql+=" and  (jxc_cljgb.xsj<="+xsj+") ";
	}
	zp=request.getParameter("zp");
	if (zp!=null)
	{
		zp=cf.GB2Uni(zp);
		if (!(zp.equals("")))	wheresql+=" and  (jxc_clbm.zp='"+zp+"')";
	}
	cllbbm=request.getParameter("cllbbm");
	if (cllbbm!=null)
	{
		cllbbm=cf.GB2Uni(cllbbm);
		if (!(cllbbm.equals("")))	wheresql+=" and  (jxc_clbm.cllbbm like '%"+cllbbm+"%')";
	}
	clysbm=request.getParameter("clysbm");
	if (clysbm!=null)
	{
		clysbm=cf.GB2Uni(clysbm);
		if (!(clysbm.equals("")))	wheresql+=" and  (jxc_clbm.clysbm like '%"+clysbm+"%')";
	}
	jldwbm=request.getParameter("jldwbm");
	if (jldwbm!=null)
	{
		jldwbm=cf.GB2Uni(jldwbm);
		if (!(jldwbm.equals("")))	wheresql+=" and  (jxc_clbm.jldwbm='"+jldwbm+"')";
	}
	sfbhpj=request.getParameter("sfbhpj");
	if (sfbhpj!=null)
	{
		sfbhpj=cf.GB2Uni(sfbhpj);
		if (!(sfbhpj.equals("")))	wheresql+=" and  (jxc_clbm.sfbhpj='"+sfbhpj+"')";
	}
	pjts=request.getParameter("pjts");
	if (pjts!=null)
	{
		pjts=pjts.trim();
		if (!(pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts>="+pjts+") ";
	}
	pjts=request.getParameter("pjts2");
	if (pjts!=null)
	{
		pjts=pjts.trim();
		if (!(pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts<="+pjts+") ";
	}

	String jgpx=request.getParameter("jgpx");
	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.ppmc,DECODE(jxc_cljgb.sftjcp,'Y','��','N','��'),DECODE(jxc_cljgb.sfyh,'Y','�л�','N','<font color=\"#FF0000\">�޻�</font>'),DECODE(jxc_cljgb.sfycx,'N','��','Y','<font color=\"#FF0000\">�д���</font>'),jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_clbm.cllbbm,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl||'%',jxc_cljgb.cxhdbl||'%',jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.lscxhdbl||'%',DECODE(jxc_clbm.sfbhpj,'Y','<font color=\"#FF0000\">��</font>','N','����'),jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.scsmc,jxc_cljgb.gysmc,jxc_clbm.lrr,jxc_clbm.lrsj,jxc_clbm.bz";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
    ls_sql+=" and jxc_cljgb.xsfs!='1'";//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4����������
    ls_sql+=" and jxc_clbm.cllb='0'";//0�����ģ�1������
    ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
    ls_sql+=wheresql;
	if (jgpx==null || jgpx.equals(""))
	{
		ls_sql+=" order by cldlbm,clxlbm,ppmc,clbm";
	}
	else{
		ls_sql+=" order by "+jgpx;
	}
	pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Jxc_clbmList.jsp?dqbm="+dqbm,"","","EditJxc_clbm.jsp?dqbm="+dqbm);
	pageObj.setPageRow(Integer.parseInt(myxssl));//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"clbm","clmc","jdm_cldlbm_zcdlmc","xh","gg","lsj","xsj","sq_dwxx_dwmc","zp","bz","ppbm","cllbbm","clysbm","jldwbm","sfbhpj","pjts","pjjg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"������ʼ","��������","�л�","�޻�","ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"StartCx.jsp?dqbm="+dqbm,"SaveEndCx.jsp?dqbm="+dqbm,"SaveIsSfyh.jsp?dqbm="+dqbm,"SaveNotSfyh.jsp?dqbm="+dqbm,"Jxc_clbmList.jsp?dqbm="+dqbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1,1,1,0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] clbm = request.getParameterValues("clbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(clbm,"clbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from jxc_clbm where "+chooseitem;
		sql[1]="delete from jxc_cljgb where  dqbm='"+dqbm+"' and "+chooseitem;
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
  <B><font size="3">���Ŀ��Ʒά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
	pageObj.displayTopButton ();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">���ı���</td>
	<td  width="2%">�ڲ�����</td>
	<td  width="4%">��������</td>
	<td  width="3%">�ͺ�</td>
	<td  width="3%">���</td>
	<td  width="4%">��Ʒ��</td>
	<td  width="2%">�Ƿ��Ƽ���Ʒ</td>
	<td  width="2%">�Ƿ��л�</td>
	<td  width="2%">�Ƿ��д���</td>
	<td  width="3%">������ʼʱ��</td>
	<td  width="3%">��������ʱ��</td>
	<td  width="4%">���ϵ��</td>
	<td  width="2%">��ɫ</td>
	<td  width="2%">������λ</td>
	<td  width="2%">�г����</td>
	<td  width="2%">���ۼ�</td>
	<td  width="2%">�����</td>
	<td  width="2%">�������</td>
	<td  width="2%">��������</td>
	<td  width="2%">������</td>
	<td  width="2%">���������</td>
	<td  width="2%">�����ڼ������</td>
	<td  width="2%">�������</td>
	<td  width="2%">�������</td>
	<td  width="2%">��Ʒ����</td>
	<td  width="3%">�������</td>
	<td  width="4%">��Ʒ˵��</td>
	<td  width="2%">����</td>
	<td  width="3%">��Ƭ����</td>
	<td  width="4%">����</td>
	<td  width="4%">С��</td>
	<td  width="3%">Ʒ��</td>
	<td  width="5%">��Ӧ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="6%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printPageLinkTr();
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